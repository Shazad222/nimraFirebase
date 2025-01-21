import 'package:flutter/material.dart';
import 'package:nimrapj/Models/user_model.dart';
import 'package:nimrapj/ViewModel/form_viewmodel.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _viewModel = FormViewModel();

  // Form Fields
  String _username = '';
  String _gender = 'Male';
  String _location = '';
  String _futureIdea = '';

  // Gender Options
  final List<String> _genders = ['Male', 'Female', 'Other'];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      UserModel user = UserModel(
        username: _username,
        gender: _gender,
        location: _location,
        futureIdea: _futureIdea,
      );

      _viewModel.saveUser(user);

      // Clear the form
      _formKey.currentState!.reset();
      setState(() {
        _gender = 'Male';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data submitted successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Username Field
              TextFormField(
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                onSaved: (value) => _username = value!,
              ),

              // Gender Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Gender'),
                value: _gender,
                items: _genders.map((gender) {
                  return DropdownMenuItem(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
              ),

              // Location Field
              TextFormField(
                decoration: InputDecoration(labelText: 'Location'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your location';
                  }
                  return null;
                },
                onSaved: (value) => _location = value!,
              ),

              // Future Idea Field
              TextFormField(
                decoration: InputDecoration(labelText: 'Future Idea'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please share your future idea';
                  }
                  return null;
                },
                onSaved: (value) => _futureIdea = value!,
              ),

              // Submit Button
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
