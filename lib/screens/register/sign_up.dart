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

class SignUpPage extends StatefulWidget {
  final User? user;
  const SignUpPage({Key? key, this.user}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController email, password, fullName, confirmPassword, dob, mobileNo;

  @override
  void initState() {
    final user = widget.user;
    email = TextEditingController(text: user?.email ?? '');
    fullName = TextEditingController(text: user?.fullName ?? '');
    confirmPassword = TextEditingController();
    password = TextEditingController();
    if (user != null) {
      dob = TextEditingController(text: dobFromDateTime(user.dob));
    } else {
      dob = TextEditingController();
    }
    mobileNo = TextEditingController(text: user?.mobileNo ?? '');

    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = getProvider<UserModel>(context, listen: true);

    var sizedBox = SizedBox(height: 2.height);
    return MyScaffold(
      showBackButton: true,
      title: 'Sign up',
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 30.height,
              child: SvgPicture.asset(
                Assets.svg.signUp,
              ),
            ),
            sizedBox,
            MyTextField(
              controller: fullName,
              // onChanged: provider.setFirstName,
              hintText: 'Full Name',
              validator: Validator.name,
              textInputAction: TextInputAction.next,
            ),
            sizedBox,
            EmailField(
              controller: email,
              // onChanged: provider.setEmail,
            ),
            sizedBox,
            // sizedBox,

            MyTextField(
              controller: mobileNo,
              prefixIcon: const Icon(Icons.phone),
              maxLength: 10,
              textInputType: TextInputType.phone,
              hintText: 'Mobile No',
              validator: Validator.mobileNo,
            ),
            MyTextField(
              controller: dob,
              hintText: 'Dob',
              suffixIcon: IconButton(icon: const Icon(Icons.date_range), onPressed: openDatePicker),
            ),
            sizedBox,
            PasswordField(
              controller: password,
              textInputAction: TextInputAction.next,
              // onChanged: provider.setPassword,/
            ),
            sizedBox,
            PasswordField(
              hintText: 'Confirm password',
              controller: confirmPassword,
              // textInputAction: TextInputAction.next,
            ),
            // SizedBox(height: 1.height),
            GenderWidget(defaultValue: provider.gender, onChanged: provider.setGender),
            SizedBox(height: 1.height),
            MyElevatedButton(
              isLoading: provider.isLoading,
              child: const Text('Submit'),
              onPressed: validate,
            ),
            sizedBox,
          ],
        ),
      ),
    );
  }

  Future<void> validate() async {
    final isValidated = _formKey.currentState!.validate();
    final provider = getProvider<UserModel>(context);
    if (isValidated) {
      await provider.signUp(
        cPassword: confirmPassword.text,
        dob: dob.text,
        email: email.text,
        fullName: fullName.text,
        gender: provider.gender,
        mobileNo: mobileNo.text,
        password: password.text,
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
