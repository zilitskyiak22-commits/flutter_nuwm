import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/user.dart';
import 'user_info_page.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({Key? key}) : super(key: key);

  @override
  _RegisterFormPageState createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  bool _hidePassword = true;
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _storyController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _selectedCountry;
  final List<String> _countries = ['Ukraine', 'USA', 'Germany', 'France'];

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _storyController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register Form"), centerTitle: true),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [

            // Full Name
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name *',
                prefixIcon: Icon(Icons.person),
                suffixIcon: IconButton(
                  icon: Icon(Icons.delete_outline, color: Colors.red),
                  onPressed: () {
                    setState(() => _nameController.clear());
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Full Name!';
                }
                return null;
              },
            ),
            SizedBox(height: 10),

            // Phone
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,15}$'), allow: true)
              ],
              validator: (value) {
                if (_validatorPhoneNumber(value!)) return null;
                return "Input number, e.g. (xxx)xxx-xxxx";
              },
              decoration: InputDecoration(
                labelText: 'Phone Number *',
                prefixIcon: Icon(Icons.call),
                suffixIcon: IconButton(
                  icon: Icon(Icons.delete_outline, color: Colors.red),
                  onPressed: () {
                    setState(() => _phoneController.clear());
                  },
                ),
              ),
            ),
            SizedBox(height: 10),

            // Email
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email Address',
                prefixIcon: Icon(Icons.mail),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value != null && value.contains('@')) return null;
                return "Enter valid email!";
              },
            ),
            SizedBox(height: 10),

            // Country Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Country',
                prefixIcon: Icon(Icons.flag),
              ),
              value: _selectedCountry,
              items: _countries.map((country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (val) => setState(() => _selectedCountry = val),
              validator: (value) {
                if (value == null) return 'Please select a country!';
                return null;
              },
            ),
            SizedBox(height: 10),

            // Story
            TextFormField(
              controller: _storyController,
              decoration: InputDecoration(
                labelText: 'Life Story',
                hintText: 'Tell us about yourself',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              inputFormatters: [LengthLimitingTextInputFormatter(200)],
            ),
            SizedBox(height: 10),

            // Password
            TextFormField(
              controller: _passwordController,
              obscureText: _hidePassword,
              maxLength: 8,
              decoration: InputDecoration(
                labelText: 'Password *',
                suffixIcon: IconButton(
                  icon: Icon(_hidePassword ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() => _hidePassword = !_hidePassword);
                  },
                ),
                prefixIcon: Icon(Icons.security),
              ),
              validator: (value) {
                if (value == null || value.length > 8) return "Password max 8 chars!";
                return null;
              },
            ),
            SizedBox(height: 10),

            // Confirm Password
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: _hidePassword,
              maxLength: 8,
              decoration: InputDecoration(
                labelText: 'Confirm Password *',
                prefixIcon: Icon(Icons.border_color),
              ),
              validator: (value) {
                if (value != _passwordController.text) {
                  return "Passwords do not match!";
                }
                return null;
              },
            ),
            SizedBox(height: 20),

            // Register Button
            ElevatedButton(
              onPressed: _submitForm,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
              ),
              child: Text("Register"),
            )
          ],
        ),
      ),
    );
  }

  bool _validatorPhoneNumber(String input) {
    final _phoneExp = RegExp(r'^\(\d\d\d\)\d\d\d-\d\d\d\d');
    return _phoneExp.hasMatch(input);
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      User user = User(
        name: _nameController.text,
        phone: _phoneController.text,
        email: _emailController.text,
        country: _selectedCountry!,
        story: _storyController.text,
      );

      print("User Info:");
      print("Name: ${user.name}");
      print("Phone: ${user.phone}");
      print("Email: ${user.email}");
      print("Country: ${user.country}");
      print("Story: ${user.story}");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UserInfoPage(user: user)),
      );
    }
  }
}
