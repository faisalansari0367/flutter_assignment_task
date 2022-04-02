import 'package:flutter/material.dart';
import 'package:flutter_assignment_task/providers/user_model.dart';
import 'package:flutter_assignment_task/widgets/gender_widget.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';

import '../../gen/assets.gen.dart';
import '../../helpers/provider_helper.dart';
import '../../helpers/validator.dart';
import '../../models/user/user.dart';
import '../../widgets/index.dart';

class UpdateProfileScreen extends StatefulWidget {
  final User user;
  const UpdateProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  late TextEditingController email, fullName, dob, mobileNo;

  @override
  void initState() {
    final provider = getProvider<UserModel>(context);
    final user = widget.user;
    provider.gender = (user.gender);
    fullName = TextEditingController(text: user.fullName);
    dob = TextEditingController(text: dobFromDateTime(user.dob));
    mobileNo = TextEditingController(text: user.mobileNo);

    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = getProvider<UserModel>(context, listen: true);
    final textFieldGap = SizedBox(height: 2.height);
    return MyScaffold(
      showBackButton: true,
      title: 'Update profile',
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 35.height,
              child: SvgPicture.asset(
                Assets.svg.signUp,
              ),
            ),
            SizedBox(height: 2.height),
            MyTextField(
              controller: fullName,
              hintText: 'Full Name',
              validator: Validator.name,
              textInputAction: TextInputAction.next,
            ),
            textFieldGap,
            MyTextField(
              controller: mobileNo,
              prefixIcon: const Icon(Icons.phone),
              maxLength: 10,
              textInputType: TextInputType.phone,
              validator: Validator.mobileNo,
              hintText: 'Mobile No',
            ),
            MyTextField(
              controller: dob,
              hintText: 'Dob',
              suffixIcon: IconButton(icon: const Icon(Icons.date_range), onPressed: openDatePicker),
            ),
            textFieldGap,
            GenderWidget(defaultValue: provider.gender, onChanged: provider.setGender),
            SizedBox(height: 1.height),
            MyElevatedButton(
              isLoading: provider.isLoading,
              child: const Text('Submit'),
              onPressed: validate,
            ),
            textFieldGap,
          ],
        ),
      ),
    );
  }

  Future<void> validate() async {
    final isValidated = _formKey.currentState!.validate();
    final provider = getProvider<UserModel>(context);
    if (isValidated) {
      await provider.updateProfileDetails(
        dob: dob.text,
        fullName: fullName.text,
        gender: provider.gender,
        mobileNo: mobileNo.text,
      );
    }
  }

  Future<void> openDatePicker() async {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1900, 1, 1),
      maxTime: DateTime.now(),
      onConfirm: onConfirm,
      currentTime: DateTime.now(),
      locale: LocaleType.en,
    );
  }

  void onConfirm(date) {
    final provider = getProvider<UserModel>(context);
    dob.text = '${date.year}-${inTensForm(date.month)}-${inTensForm(date.day)}';
    provider.dob = dob.text;
  }

  String dobFromDateTime(DateTime date) => '${date.year}-${inTensForm(date.month)}-${inTensForm(date.day)}';
  String inTensForm(int value) => value <= 10 ? '0$value' : value.toString();
}
