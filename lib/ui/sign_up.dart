import 'package:episode/constants/episode_colors.dart';
import 'package:episode/data/episode_store.dart';
import 'package:episode/ui/ui_components/episode_app_bar.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key, required this.store});

  final EpisodeStore store;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EpisodeAppBar(title: 'Sign Up'),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.tv,
                    size: 64,
                    color: EpisodeColors.episodeBlue,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Create your Episode account',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 28),
                  TextFormField(
                    controller: _nameController,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Enter your name.'
                        : null,
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: _validateEmail,
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: (value) => value == null || value.length < 8
                        ? 'Use at least 8 characters.'
                        : null,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _submit,
                    child: const Text('Create Account'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'This prototype does not save accounts to a service.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: EpisodeColors.fadedBlack,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || !value.contains('@') || !value.contains('.')) {
      return 'Enter a valid email address.';
    }
    return null;
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    widget.store.setUserName(_nameController.text);
    Navigator.popUntil(context, (route) => route.isFirst);
  }
}
