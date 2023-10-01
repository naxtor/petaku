import 'package:flutter/material.dart';
import 'package:mp_tp_2/providers/app_provider.dart';
import 'package:provider/provider.dart';

class UserFormScreen extends StatefulWidget {
  const UserFormScreen({super.key});

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController hobby = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<AppProvider>(
        context,
        listen: false,
      );

      setState(() {
        name.text = provider.userName;
        hobby.text = provider.userHobby;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          children: [
            TextFormField(
              controller: name,
              decoration: const InputDecoration(
                hintText: 'Masukkan Nama Anda',
                labelText: 'Nama',
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Form harus diisi !';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: TextFormField(
                controller: hobby,
                decoration: const InputDecoration(
                  hintText: 'Masukkan Hobby Anda',
                  labelText: 'Hobby',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Form harus diisi !';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final provider = Provider.of<AppProvider>(
                    context,
                    listen: false,
                  );

                  provider.updateUser(
                    newUsername: name.text,
                    newHobby: hobby.text,
                  );
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
