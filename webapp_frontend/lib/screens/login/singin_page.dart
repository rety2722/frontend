import 'package:flutter/material.dart';
import 'package:webapp_frontend/utils/secure_storage.dart';
import 'package:webapp_frontend/widgets/buttons/sign_in_user.dart';
import 'package:webapp_frontend/widgets/input_fields/input_fields.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({
    super.key,
  });

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _formKey = GlobalKey<FormState>();

  late PasswordInputField _passwordInputField;
  late EmailInputField _emailInputField;

  @override
  void initState() {
    _passwordInputField = PasswordInputField();
    _emailInputField = EmailInputField(
      nextFocusNode: _passwordInputField.focusNode,
    );

    _loadSavedCredentials();

    super.initState();
  }

  Future<void> _loadSavedCredentials() async {
    try {
      String email = await SecureStorage().read('email') ?? '';
      String password = await SecureStorage().read('password') ?? '';

      setState(() {
        _emailInputField.controller.text = email;
        _emailInputField.controller.text = password;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 620,
        padding: EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 24,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Sing in",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _emailInputField,
                      SizedBox(height: 16),
                      _passwordInputField,
                      SignInUser(
                        formKey: _formKey,
                        emailController: _emailInputField.controller,
                        passwordController: _passwordInputField.controller,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
