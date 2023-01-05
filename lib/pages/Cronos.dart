import 'package:flutter/material.dart';
import 'package:flutter_crono_app/components/cronometro.dart';
import 'package:flutter_crono_app/components/entradaTempo.dart';

class Cronos extends StatelessWidget {
  const Cronos({required String titulo, required valor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Cronometro(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                EntradaTempo(
                  titulo: 'trabalho',
                  valor: 25,
                ),
                EntradaTempo(
                  titulo: 'Descanso',
                  valor: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
