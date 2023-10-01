import 'package:flutter/material.dart';
import 'package:mp_tp_2/screens/splash_screen.dart';

void main() {
  runApp(const PetaKu());
}

class PetaKu extends StatelessWidget {
  const PetaKu({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
