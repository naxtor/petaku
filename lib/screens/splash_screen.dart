import 'package:flutter/material.dart';
import 'package:mp_tp_2/navigators/app_bottom_navigator.dart';
import 'package:mp_tp_2/providers/app_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AppProvider(),
            child: const AppBottomNavigator(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'PetaKu',
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w400,
            letterSpacing: 10,
          ),
        ),
      ),
    );
  }
}
