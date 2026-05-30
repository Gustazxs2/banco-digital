import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double saldo = 2500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Banco Gamer')),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            Card(
              child: ListTile(
                title: const Text('Saldo'),
                subtitle: Text('R\$ $saldo'),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/transferencia',
                  arguments: saldo,
                );
              },
              child: const Text('Transferência'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cotacao');
              },
              child: const Text('Cotação'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/store');
              },
              child: const Text('Loja Gamer'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: const Text('Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}
