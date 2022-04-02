import 'package:flutter/material.dart';
import 'package:flutter_assignment_task/screens/home/home_screen.dart';
import 'package:flutter_assignment_task/size_config.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../helpers/provider_helper.dart';
import '../../../../widgets/my_elevated_button.dart';
import '../../../../widgets/my_scaffold.dart';
import '../../../../widgets/text_fields/email_field.dart';
import '../../../../widgets/text_fields/password_field.dart';
import '../../helpers/redirect.dart';
import '../../providers/user_model.dart';
import '../register/sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    final provider = getProvider<UserModel>(context, listen: true);

    return MyScaffold(
      title: 'Login',
      body: Form(
        key: _formKey,
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Center(
              child: SvgPicture.asset(
                Assets.svg.loginAccount,
                width: 70.width,
              ),
            ),
            SizedBox(height: 6.height),
            EmailField(
              onChanged: provider.setEmail,
            ),
            SizedBox(height: 2.height),
            PasswordField(
              onChanged: provider.setPassword,
              onSubmitted: (p0) => onPressed(),
            ),
           
            SizedBox(height: 2.height),

            MyElevatedButton(
              isLoading: provider.isLoading,
              child: const Text('Login'),
              onPressed: onPressed,
            ),
            SizedBox(
              width: 100.width,
              child: Center(
                child: TextButton(
                  onPressed: createNewAccount,
                  child: const Text('Create a new account'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    final isValidated = _formKey.currentState!.validate();
    if (isValidated) {
      final provider = getProvider<UserModel>(context);
      await provider.login();
      if (provider.isLoggedIn) {
        final route = MaterialPageRoute(builder: (context) => const HomeScreen());
        Navigator.pushReplacement(context, route);
      }
    }
  }

  Future<void> createNewAccount() async => Redirect.to(context, const SignUpPage());
}
