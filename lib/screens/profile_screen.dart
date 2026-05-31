import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 4;

  final List<String> _rotas = [
    '/home',
    '/transferencia',
    '/store',
    '/cotacao',
    '/profile',
  ];

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
                  children: [
                    Text(
                      "PERFIL",
                      style: GoogleFonts.pressStart2p(
                        color: const Color(0xFFFFD700),
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1040),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF3D2D8A),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 45,
                            backgroundColor: const Color(0xFFFFD700),
                            child: const Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 50,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Jogador Pixel",
                            style: GoogleFonts.pressStart2p(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          _infoCard(
                            "NÍVEL",
                            "42",
                            Icons.star,
                          ),
                          const SizedBox(height: 12),
                          _infoCard(
                            "SALDO",
                            "R\$ 12.500",
                            Icons.account_balance_wallet,
                          ),
                          const SizedBox(height: 12),
                          _infoCard(
                            "TRANSFERÊNCIAS",
                            "18",
                            Icons.send,
                          ),
                          const SizedBox(height: 12),
                          _infoCard(
                            "COMPRAS",
                            "7",
                            Icons.shopping_cart,
                          ),
                          const SizedBox(height: 25),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "XP",
                              style: GoogleFonts.pressStart2p(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: 0.55,
                              minHeight: 15,
                              backgroundColor: const Color(0xFF2A1F6F),
                              valueColor: const AlwaysStoppedAnimation(
                                Color(0xFFFFD700),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "1650 / 3000 XP",
                              style: TextStyle(
                                color: Color(0xFFFFD700),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/',
                                  (route) => false,
                                );
                              },
                              icon: const Icon(
                                Icons.logout,
                                color: Colors.black,
                              ),
                              label: Text(
                                "LOGOUT",
                                style: GoogleFonts.pressStart2p(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFFD700),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
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

  Widget _infoCard(
    String titulo,
    String valor,
    IconData icone,
  ) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF120A3A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            icone,
            color: const Color(0xFFFFD700),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              titulo,
              style: const TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
          Text(
            valor,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavBar() {
    final items = [
      {'icone': Icons.home_rounded, 'label': 'HOME'},
      {'icone': Icons.send_rounded, 'label': 'PIX'},
      {'icone': Icons.storefront_rounded, 'label': 'LOJA'},
      {'icone': Icons.show_chart_rounded, 'label': 'COTAÇÃO'},
      {'icone': Icons.person_rounded, 'label': 'PERFIL'},
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
                  const SizedBox(height: 4),
                  Text(
                    items[i]['label'] as String,
                    style: TextStyle(
                      color: selecionado
                          ? const Color(0xFFFFD700)
                          : const Color(0xFF6B5B9A),
                      fontSize: 8,
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
