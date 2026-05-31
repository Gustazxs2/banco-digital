import 'package:flutter/material.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  int _selectedIndex = 3;

  final List<String> _rotas = [
    '/home',
    '/transferencia',
    '/cotacao',
    '/store',
  ];

  final List<Map<String, dynamic>> produtos = [
    {
      "nome": "Steam R\$ 50",
      "preco": "R\$ 50,00",
      "icone": Icons.sports_esports,
    },
    {
      "nome": "Steam R\$ 100",
      "preco": "R\$ 100,00",
      "icone": Icons.sports_esports,
    },
    {
      "nome": "Xbox Gift Card",
      "preco": "R\$ 50,00",
      "icone": Icons.gamepad,
    },
    {
      "nome": "PlayStation",
      "preco": "R\$ 100,00",
      "icone": Icons.videogame_asset,
    },
    {
      "nome": "Google Play",
      "preco": "R\$ 25,00",
      "icone": Icons.android,
    },
    {
      "nome": "Game Pass",
      "preco": "R\$ 59,90",
      "icone": Icons.star,
    },
  ];

  void _onNavTap(int index) {
    if (index == _selectedIndex) return;

    Navigator.pushReplacementNamed(
      context,
      _rotas[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF07031A),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      "LOJA",
                      style: TextStyle(
                        color: Color(0xFFFFD700),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Gift Cards e produtos gamers",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: GridView.builder(
                        itemCount: produtos.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.75,
                        ),
                        itemBuilder: (context, index) {
                          final produto = produtos[index];

                          return Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1A1040),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFF3D2D8A),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  produto["icone"],
                                  color: const Color(0xFFFFD700),
                                  size: 40,
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      produto["nome"],
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  produto["preco"],
                                  style: const TextStyle(
                                    color: Color(0xFFFFD700),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                ElevatedButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "${produto["nome"]} comprado!",
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFFFD700),
                                    foregroundColor: Colors.black,
                                  ),
                                  child: const Text(
                                    "COMPRAR",
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
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
              onTap: () => _onNavTap(i),
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
                      letterSpacing: 0.5,
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
