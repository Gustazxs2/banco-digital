import 'package:flutter/material.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF07031A),
      body: SafeArea(
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
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.65,
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
                          Text(
                            produto["nome"],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
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
                          const SizedBox(height: 10),
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
    );
  }
}
