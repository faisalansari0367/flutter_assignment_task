import 'package:flutter/material.dart';

import '../../../constans.dart';
import '../../../helpers/provider_helper.dart';
import '../../../helpers/validator.dart';
import '../../../providers/user_model.dart';
import '../../../services/database_service.dart';
import '../../../widgets/index.dart';

class AddContactWidget extends StatefulWidget {
  const AddContactWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AddContactWidget> createState() => _AddContactWidgetState();
}

class _AddContactWidgetState extends State<AddContactWidget> {
  late TextEditingController email, fullName, mobileNo;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    fullName = TextEditingController();
    email = TextEditingController();
    mobileNo = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    fullName.dispose();
    email.dispose();
    mobileNo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sizedBox = SizedBox(height: 2.height);
    return Form(
      key: _formKey,
      child: Container(
        padding: MediaQuery.of(context).viewInsets,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 1.height),
              Container(
                height: 0.5.height,
                width: 8.width,
                decoration: BoxDecoration(
                  borderRadius: kBorderRadius,
                  color: Colors.grey.shade300,
                ),
              ),
              sizedBox,
              MyTextField(
                hintText: 'Full name',
                controller: fullName,
                validator: Validator.name,
              ),
              sizedBox,
              EmailField(
                controller: email,
              ),
              sizedBox,
              MyTextField(
                prefixIcon: const Icon(Icons.phone),
                maxLength: 10,
                textInputType: TextInputType.phone,
                hintText: 'Mobile No',
                controller: mobileNo,
                validator: Validator.mobileNo,
              ),
              sizedBox,
              MyElevatedButton(
                child: const Text('Add Contact'),
                onPressed: _onPressed,
              ),
              sizedBox,
            ],
          ),
        ),
      ),
    );
  }

  void _onPressed() {
    final isValidated = _formKey.currentState!.validate();
    if (!isValidated) return;
    final provider = getProvider<UserModel>(context);
    final db = DatabaseService(provider.user!.id.toString());
    db.addContact(email: email.text, fullName: fullName.text, mobileNo: mobileNo.text);
    Navigator.pop(context);
  }
}