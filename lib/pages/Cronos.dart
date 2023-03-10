import 'package:flutter/material.dart';
import 'package:flutter_crono_app/components/cronometro.dart';
import 'package:flutter_crono_app/components/entradaTempo.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../store/cronos.store.dart';

class Cronos extends StatelessWidget {
  const Cronos({required String titulo, required valor});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<CronosStore>(context);

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
            child: Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  EntradaTempo(
                    titulo: 'Disparar',
                    valor: store.dispararTempo,
                    inc: store.iniciado && store.disparar()
                        ? null
                        : store.incrementarDispararTempo,
                    dec: store.iniciado && store.disparar()
                        ? null
                        : store.decrementarDispararTempo,
                  ),
                  EntradaTempo(
                    titulo: 'Descanso',
                    valor: store.tempoDescanso,
                    inc: store.iniciado && store.disparar()
                        ? null
                        : store.incrementarTempoDescanso,
                    dec: store.iniciado && store.disparar()
                        ? null
                        : store.decrementartempoDescanso,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
