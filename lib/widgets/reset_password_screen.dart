import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png?utm_source=uk.wikipedia.org&utm_campaign=index&utm_content=original",
                  width: 200,
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: Text(
                  "Reset Password",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email / Login',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Field is required';
                  }
                  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(value.trim())) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return const AlertDialog(
                          title: Text('Message'),
                          content: Text("Need to implement"),
                        );
                      },
                    );
                  }
                },
                child: const Text("Reset"),
              ),
              const SizedBox(height: 16.0),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Back"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}