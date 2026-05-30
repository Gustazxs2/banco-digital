import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),

          child: Column(
            children: [
              const SizedBox(height: 80),

              const Text(
                'PixelBank ',

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 60),

              const Text(
                'Bem-vindo de volta',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 40),

              const Text(
                'Acesse sua conta',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              const SizedBox(height: 25),

              TextField(
                decoration: InputDecoration(
                  hintText: 'E-mail',

                  filled: true,

                  fillColor: const Color(0xFF1A1D29),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              TextField(
                obscureText: true,

                decoration: InputDecoration(
                  hintText: 'Senha',

                  filled: true,

                  fillColor: const Color(0xFF1A1D29),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,

                height: 56,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD8F400),

                    foregroundColor: Colors.black,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(23),
                    ),
                  ),

                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },

                  child: const Text('Entrar', style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 25),

              TextButton(
                onPressed: () {},
                child: const Text('Esqueci minha senha'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },

                child: const Text('Criar conta'),
              ),
              TextButton.icon(
                onPressed: () {},

                icon: const Icon(Icons.fingerprint),

                label: const Text('Entrar com digital'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
