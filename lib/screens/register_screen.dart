import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmarSenhaController = TextEditingController();

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
                const SizedBox(height: 8),
                const Text(
                  "CRIAR UM NOVO HEROI",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF8A2BE2),
                          shape: const RoundedRectangleBorder(),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFD000),
                          shape: const RoundedRectangleBorder(),
                        ),
                        onPressed: () {},
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
                  child: Text(
                    "NOME",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 5),
                _campo(
                    controller: nomeController, hint: "Insira o seu nome..."),
                const SizedBox(height: 15),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("EMAIL", style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 5),
                _campo(controller: emailController, hint: "Insira E-mail"),
                const SizedBox(height: 15),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "SENHA",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 5),
                _campo(
                  controller: senhaController,
                  hint: "Insira a senha...",
                  obscure: true,
                ),
                const SizedBox(height: 15),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "CONFIRMA SENHA",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 5),
                _campo(
                  controller: confirmarSenhaController,
                  hint: "Confirmar senha...",
                  obscure: true,
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFFFD000)),
                  ),
                  child: const Text(
                    "NOVOS HEROIS GANHAM PROMOCÕES",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFFFFD000), fontSize: 12),
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFD000),
                      foregroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(),
                    ),
                    onPressed: () {
                      if (nomeController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          senhaController.text.isEmpty ||
                          confirmarSenhaController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Preencha todos os campos'),
                          ),
                        );

                        return;
                      }

                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: const Text(
                      "CRIAR HEROI",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Ja tem uma conta?",
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

  Widget _campo({
    required TextEditingController controller,
    required String hint,
    bool obscure = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFFC08FFF)),
        filled: true,
        fillColor: const Color(0xFF7B1BC9),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Color(0xFF2B003D), width: 3),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Color(0xFF2B003D), width: 3),
        ),
      ),
    );
  }
}
