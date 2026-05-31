import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final TextEditingController valorController = TextEditingController();
  final TextEditingController chaveController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();

  int _selectedIndex = 1;

  final List<String> _rotas = [
    '/home',
    '/transferencia',
    '/cotacao',
    '/store',
  ];

  void realizarTransferencia() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Transferência realizada com sucesso!"),
      ),
    );

    valorController.clear();
    chaveController.clear();
    descricaoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF07031A),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      "TRANSFERIR",
                      style: GoogleFonts.pressStart2p(
                        fontSize: 16,
                        color: const Color(0xFFFFD700),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Envie dinheiro para outra conta",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A145A),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF8E5BFF),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "VALOR",
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: valorController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: _inputDecoration(
                              "Digite o valor",
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "CHAVE PIX",
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: chaveController,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: _inputDecoration(
                              "CPF, E-mail ou Telefone",
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "DESCRIÇÃO",
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: descricaoController,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: _inputDecoration(
                              "Mensagem opcional",
                            ),
                          ),
                          const SizedBox(height: 25),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: realizarTransferencia,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF8E5BFF),
                                minimumSize: const Size(
                                  double.infinity,
                                  55,
                                ),
                              ),
                              child: const Text(
                                "ENVIAR PIX",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      "TRANSFERÊNCIAS RECENTES",
                      style: TextStyle(
                        color: Color(0xFFFFD700),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.2,
                      children: [
                        historicoCard(
                          "João",
                          "R\$ 50,00",
                        ),
                        historicoCard(
                          "Maria",
                          "R\$ 200,00",
                        ),
                        historicoCard(
                          "Pedro",
                          "R\$ 120,00",
                        ),
                        historicoCard(
                          "Ana",
                          "R\$ 75,00",
                        ),
                      ],
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

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        color: Colors.white54,
      ),
      filled: true,
      fillColor: const Color(0xFF1A1040),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Color(0xFF8E5BFF),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Color(0xFF8E5BFF),
        ),
      ),
    );
  }

  Widget historicoCard(
    String nome,
    String valor,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF2A145A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF8E5BFF),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.person,
            color: Colors.white,
            size: 40,
          ),
          const SizedBox(height: 10),
          Text(
            nome,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            valor,
            style: const TextStyle(
              color: Color(0xFFFFD700),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavBar() {
    final items = [
      {'icone': Icons.home_rounded, 'label': 'INÍCIO'},
      {'icone': Icons.send_rounded, 'label': 'PIX'},
      {'icone': Icons.show_chart_rounded, 'label': 'COTAÇÃO'},
      {'icone': Icons.storefront_rounded, 'label': 'LOJA'},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF110E28),
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
                  ),
                  Text(
                    items[i]['label'] as String,
                    style: TextStyle(
                      fontSize: 10,
                      color: selecionado
                          ? const Color(0xFFFFD700)
                          : const Color(0xFF6B5B9A),
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
}
