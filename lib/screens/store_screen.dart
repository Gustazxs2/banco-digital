import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loja Gamer')),

      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.games),
            title: Text('Steam Gift Card'),
            subtitle: Text('R\$ 50'),
          ),

          ListTile(
            leading: Icon(Icons.games),
            title: Text('Xbox Gift Card'),
            subtitle: Text('R\$ 50'),
          ),

          ListTile(
            leading: Icon(Icons.games),
            title: Text('PSN Gift Card'),
            subtitle: Text('R\$ 100'),
          ),
        ],
      ),
    );
  }
}
