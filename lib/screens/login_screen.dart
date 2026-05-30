import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5D1BA8),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 380,
            padding: const EdgeInsets.all(20),

            decoration: const BoxDecoration(color: Color(0xFF6B12B9)),

            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,

                  decoration: BoxDecoration(
                    color: const Color(0xFFFFD000),
                    borderRadius: BorderRadius.circular(6),
                  ),

                  child: const Icon(
                    Icons.sports_esports,
                    size: 40,
                    color: Colors.deepPurple,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "PIXEL BANK",
                  style: TextStyle(
                    color: Color(0xFFFFD000),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  "ACESSE SUA CONTA",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),

                const SizedBox(height: 25),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFD000),

                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),

                        onPressed: () {},

                        child: const Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFD000),

                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),

                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },

                        child: const Text(
                          "CADASTRO",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("E-MAIL", style: TextStyle(color: Colors.white)),
                ),

                const SizedBox(height: 5),

                TextField(
                  controller: emailController,

                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF8A2BE2),

                    hintText: "Digite seu e-mail",

                    border: OutlineInputBorder(borderRadius: BorderRadius.zero),
                  ),
                ),

                const SizedBox(height: 15),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("SENHA", style: TextStyle(color: Colors.white)),
                ),

                const SizedBox(height: 5),

                TextField(
                  controller: senhaController,
                  obscureText: true,

                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF8A2BE2),

                    hintText: "Digite sua senha",

                    border: OutlineInputBorder(borderRadius: BorderRadius.zero),
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFD000),

                      foregroundColor: Colors.black,

                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),

                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },

                    child: const Text(
                      "ENTRAR",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                TextButton(
                  onPressed: () {},

                  child: const Text(
                    "Esqueci minha senha",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                TextButton.icon(
                  onPressed: () {},

                  icon: const Icon(Icons.fingerprint, color: Colors.white),

                  label: const Text(
                    "Entrar com digital",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
