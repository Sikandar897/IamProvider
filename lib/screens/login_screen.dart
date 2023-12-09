import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example_2/provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Login Page',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple),
      body: Center(
        child: SizedBox(
          width: 400,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(21)),
                    ),
                    label: Text('Email'),
                    hintText: 'Enter Your Email'),
              ),
              const SizedBox(
                height: 21,
              ),
              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(21)),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  suffix: Icon(Icons.remove_red_eye_outlined),
                  label: Text('Password'),
                  hintText: 'Enter Your Password',
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              ElevatedButton(
                  onPressed: () {
                    authProvider.login(emailController.text.toString(),
                        passwordController.text.toString());
                  },
                  style: ButtonStyle(
                    fixedSize: const MaterialStatePropertyAll(Size(100, 50)),
                    shadowColor:
                        MaterialStatePropertyAll(Colors.deepPurple.shade100),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.deepPurple),
                    overlayColor:
                        MaterialStatePropertyAll(Colors.deepPurple.shade400),
                    elevation: const MaterialStatePropertyAll(21),
                  ),
                  child: authProvider.loading
                      ? const CircularProgressIndicator(color: Colors.white,)
                      : const Text(
                          'login',
                          style: TextStyle(color: Colors.white),
                        ))
            ],
          ),
        ),
      ),
    );
  }
}
