import 'package:flutter/material.dart';

import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/home_screen.dart';
import '../screens/cotacao_screen.dart';
import '../screens/transfer_screen.dart';
import '../screens/store_screen.dart';
import '../screens/profile_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const LoginScreen(),
  '/register': (context) => const RegisterScreen(),
  '/home': (context) => const HomeScreen(),
  '/cotacao': (context) => const CotacaoScreen(),
  '/transferencia': (context) => const TransferScreen(),
  '/store': (context) => const StoreScreen(),
  '/profile': (context) => const ProfileScreen(),
};
