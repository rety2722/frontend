import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:webapp_frontend/services/api_routes.dart';

import 'package:http/http.dart' as http;
import 'package:webapp_frontend/utils/secure_storage.dart';

class SignInUser extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInUser({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });


  @override
  State<SignInUser> createState() => _SignInUserState();
}

class _SignInUserState extends State<SignInUser> {
  Future<void> _loginUser() async {
    if (widget.formKey.currentState?.validate() ?? false) {
      try {
        final url = _composeSigninUri();
        final headers = _composeSignInHeaders();
        final body = _composeSignInBody();

        final response = await http.post(
          url,
          headers: headers,
          body: body,
        );

        if (response.statusCode.toString().startsWith('2')) {
          await _handleSignin(responseBody: response.body);
        } else {
          _handleFailure();
        }
      } catch (e) {
        rethrow;
      }
    }
  }

  Uri _composeSigninUri() {
    return Uri.parse("${dotenv.env["SERVER_ADRESS"]}${ApiRoutes.signIn}");
  }

  Map<String, String> _composeSignInHeaders() {
    return {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
  }

  Map<String, String> _composeSignInBody() {
    return {
      'username': widget.emailController.text,
      'password': widget.passwordController.text,
    };
  }

  Future<void> _saveCredentials(
    String token,
    String tokenLifetime,
    String email,
    String password,
  ) async {
    try {
      await SecureStorage().write('bearerToken', token);
      await SecureStorage().write('tokenExpirationTime', tokenLifetime);
    } catch (e) {
      rethrow;
    }
  }

  int _calculateExpirationTime(int tokenLifetime) {
    return DateTime.now()
        .add(Duration(seconds: tokenLifetime))
        .millisecondsSinceEpoch;
  }

  Future<void> _handleSignin({required String responseBody}) async {
    final data = jsonDecode(responseBody);

    final String token = data['access_token'];
    const int tokenLifetimeInt = 60 * 60; // hour in seconds
    final String tokenLifetime =
        _calculateExpirationTime(tokenLifetimeInt).toString();
    final String email = widget.emailController.text;
    final String password = widget.emailController.text;

    await _saveCredentials(token, tokenLifetime, email, password);
  }

  void _handleFailure() {

  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _loginUser,
      child: const Text('Login'),
    );
  }
}
