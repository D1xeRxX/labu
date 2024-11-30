import 'package:flutter/material.dart';
import 'network_service.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _networkService = NetworkService();

  void _validateAndResetPassword() {
    if (_formKey.currentState?.validate() == true) {
      final data = {'email': _emailController.text};
      _networkService.sendData(data, 'reset-password');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Дані для відновлення пароля надіслано!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Будь ласка, введіть правильний email.')),
      );
    }
  }

  void _clearFields() {
    _emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Поле обов’язкове';
                  }
                  final emailRegex = RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Введіть правильний email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: _validateAndResetPassword,
                child: Text('Reset Password'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _clearFields,
                child: Text('Clear Fields'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
