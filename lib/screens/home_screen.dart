import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _saldoVisivel = true;

  final String username = 'JOGADOR';
  final int playerNumber = 55;
  final int level = 42;
  final double xpAtual = 500;
  final double xpTotal = 3000;
  final double saldo = 12500.00;
  final String conta = 'ACC-5472-1942';
  final String cartao = '**** **** **** 5421';

  // Rotas correspondentes a cada aba da navbar
  final List<String> _rotas = [
    '/home',
    '/transferencia',
    '/cotacao',
    '/store',
  ];

  void _onNavTap(int index) {
    if (index == _selectedIndex) return;
    setState(() => _selectedIndex = index);
    if (index != 0) {
      Navigator.pushNamed(
        context,
        _rotas[index],
        arguments: index == 1 ? saldo : null,
      ).then((_) {
        // Ao voltar de outra tela, volta o índice para Home
        setState(() => _selectedIndex = 0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0B1E),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 16),
                    _buildBarraXP(),
                    const SizedBox(height: 16),
                    _buildCartaoSaldo(),
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

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: const TextStyle(
                color: Color(0xFFE0D8FF),
                fontSize: 13,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            Text(
              '$playerNumber',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
          ],
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1040),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFF7B5EA7),
                    width: 1.5,
                  ),
                ),
                child: const Icon(
                  Icons.person,
                  color: Color(0xFFFFD700),
                  size: 24,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF2A1F6F),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: const Color(0xFF7B5EA7),
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.flash_on,
                    color: Color(0xFFFFD700),
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'LV $level',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBarraXP() {
    final double progresso = xpAtual / xpTotal;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'EXPERIÊNCIA',
              style: TextStyle(
                color: Color(0xFF9B8FC0),
                fontSize: 10,
                letterSpacing: 2,
              ),
            ),
            Text(
              '${xpAtual.toInt()}/${xpTotal.toInt()} XP',
              style: const TextStyle(
                color: Color(0xFF9B8FC0),
                fontSize: 10,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progresso,
            minHeight: 10,
            backgroundColor: const Color(0xFF1E1740),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFFD700)),
          ),
        ),
      ],
    );
  }

  Widget _buildCartaoSaldo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1040),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF3D2D8A), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'SALDO EM GOLD',
                style: TextStyle(
                  color: Color(0xFF9B8FC0),
                  fontSize: 11,
                  letterSpacing: 2,
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => _saldoVisivel = !_saldoVisivel),
                child: Icon(
                  _saldoVisivel
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: const Color(0xFF9B8FC0),
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text('💰', style: TextStyle(fontSize: 26)),
              const SizedBox(width: 10),
              Text(
                _saldoVisivel
                    ? 'R\$ ${saldo.toStringAsFixed(2).replaceAll('.', ',')}'
                    : '••••••',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildInfoConta('CONTA', conta)),
              const SizedBox(width: 12),
              Expanded(child: _buildInfoConta('CARTÃO', cartao)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoConta(String label, String valor) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF0D0B1E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF9B8FC0),
              fontSize: 9,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            valor,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontFamily: 'monospace',
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: const BoxDecoration(
        color: Color(0xFF110E28),
        border: Border(top: BorderSide(color: Color(0xFF2A1F6F), width: 1.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (i) {
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
        }),
      ),
    );
  }
}
