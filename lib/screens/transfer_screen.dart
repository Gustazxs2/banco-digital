import 'package:flutter/material.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final saldo = ModalRoute.of(context)!.settings.arguments as double;

    return Scaffold(
      appBar: AppBar(title: const Text('Transferência')),

      body: Center(child: Text('Saldo disponível: R\$ $saldo')),
    );
  }
}
