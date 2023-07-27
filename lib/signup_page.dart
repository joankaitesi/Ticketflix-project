import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  @override
  void dispose() {
    // Clean up the text controllers when the widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildInputField(
                  'Email', _emailController, TextInputType.emailAddress),
              SizedBox(height: 16),
              _buildInputField(
                  'Password', _passwordController, TextInputType.text,
                  obscureText: true),
              SizedBox(height: 16),
              _buildInputField('Confirm Password', _confirmPasswordController,
                  TextInputType.text,
                  obscureText: true),
              SizedBox(height: 16),
              _buildInputField('Age', _ageController, TextInputType.number),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState != null &&
                      _formKey.currentState!.validate()) {
                    // navigate to home page
                    Navigator.pushNamed(context, '/HomeScreen');
                  }
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller,
      TextInputType keyboardType,
      {bool obscureText = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your $label',
            ),
            validator: (value) {
              if ((value ?? '').isEmpty) {
                return 'Please enter your $label';
              }
              // Add any additional validation for the specific field if needed
              return null;
            },
          ),
        ],
      ),
    );
  }
}
