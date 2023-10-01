import 'package:flutter/material.dart';
import 'package:mp_tp_2/providers/app_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AppProvider>(
        builder: (context, value, child) {
          if (value.userName.isEmpty && value.userHobby.isEmpty) {
            return const Center(
              child: Text(
                'Data user belom terisi,\nsilahkan diisi terlebih dahulu',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            );
          }

          return Center(
            child: Text(
              'Selamat datang, ${value.userName}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }
}
