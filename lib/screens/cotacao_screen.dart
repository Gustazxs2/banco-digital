import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CotacaoScreen extends StatefulWidget {
  const CotacaoScreen({super.key});

  @override
  State<CotacaoScreen> createState() => _CotacaoScreenState();
}

class _CotacaoScreenState extends State<CotacaoScreen> {
  Map<String, dynamic>? dados;

  bool carregando = true;

  @override
  void initState() {
    super.initState();

    buscarCotacao();
  }

  Future<void> buscarCotacao() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://economia.awesomeapi.com.br/json/last/USD-BRL,EUR-BRL,BTC-BRL',
        ),
      );

      if (response.statusCode == 200) {
        setState(() {
          dados = jsonDecode(response.body);

          carregando = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5D1BA8),

      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD000),

        title: const Text("COTAÇÕES"),
      ),

      body: carregando
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                children: [
                  cardMoeda("Dólar", dados!['USDBRL']['bid']),

                  const SizedBox(height: 15),

                  cardMoeda("Euro", dados!['EURBRL']['bid']),

                  const SizedBox(height: 15),

                  cardMoeda("Bitcoin", dados!['BTCBRL']['bid']),
                ],
              ),
            ),
    );
  }

  Widget cardMoeda(String nome, String valor) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: const Color(0xFF6B12B9),

        border: Border.all(color: const Color(0xFFFFD000)),
      ),

      child: Column(
        children: [
          Text(
            nome,

            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            "R\$ $valor",

            style: const TextStyle(
              color: Color(0xFFFFD000),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
