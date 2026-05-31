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

  final TextEditingController quantidadeController = TextEditingController();

  double valorDigitado = 1;

  int _selectedIndex = 2;

  final List<String> _rotas = [
    '/home',
    '/transferencia',
    '/cotacao',
    '/store',
  ];

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
      backgroundColor: const Color(0xFF07031A),
      body: carregando
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          const Text(
                            "COTAÇÕES",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextField(
                            controller: quantidadeController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              hintText: "Digite uma quantidade",
                              hintStyle: const TextStyle(
                                color: Colors.white54,
                              ),
                              filled: true,
                              fillColor: const Color(0xFF1A1040),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                valorDigitado = double.tryParse(value) ?? 1;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          cardMoeda(
                            "Dólar",
                            (double.parse(
                                      dados!['USDBRL']['bid'],
                                    ) *
                                    valorDigitado)
                                .toStringAsFixed(2),
                          ),
                          cardMoeda(
                            "Euro",
                            (double.parse(
                                      dados!['EURBRL']['bid'],
                                    ) *
                                    valorDigitado)
                                .toStringAsFixed(2),
                          ),
                          cardMoeda(
                            "Bitcoin",
                            (double.parse(
                                      dados!['BTCBRL']['bid'],
                                    ) *
                                    valorDigitado)
                                .toStringAsFixed(2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _buildNavBar(),
                ],
              ),
            ),
    );
  }

  Widget _buildNavBar() {
    final items = [
      {'icone': Icons.home_rounded, 'label': 'INÍCIO'},
      {'icone': Icons.send_rounded, 'label': 'ENVIAR'},
      {'icone': Icons.show_chart_rounded, 'label': 'COTAÇÃO'},
      {'icone': Icons.storefront_rounded, 'label': 'LOJA'},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 8,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF110E28),
        border: Border(
          top: BorderSide(
            color: Color(0xFF2A1F6F),
            width: 1.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          items.length,
          (i) {
            final selecionado = _selectedIndex == i;

            return GestureDetector(
              onTap: () {
                if (i == _selectedIndex) return;

                Navigator.pushReplacementNamed(
                  context,
                  _rotas[i],
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    items[i]['icone'] as IconData,
                    color: selecionado
                        ? const Color(0xFFFFD700)
                        : const Color(0xFF6B5B9A),
                    size: 22,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    items[i]['label'] as String,
                    style: TextStyle(
                      color: selecionado
                          ? const Color(0xFFFFD700)
                          : const Color(0xFF6B5B9A),
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget cardMoeda(String nome, String valor) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1040),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF3D2D8A),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nome,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "R\$ $valor",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
