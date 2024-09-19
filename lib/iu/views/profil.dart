import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _name = '';
  String _email = '';
  String _password = '';

  @override
  void initState() {
    super.initState();
    
    _name = 'John Doe';
    _email = 'john.doe@example.com';
    _password = 'password123';

    _nameController.text = _name;
    _emailController.text = _email;
    _passwordController.text = _password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nom',
              ),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Mot de passe',
              ),
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Enregistrer les modifications dans une source de données (par exemple, un service d'authentification)
                print('Nom: $_name');
                print('Email: $_email');
                print('Mot de passe: $_password');
              },
              child: const Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }
}