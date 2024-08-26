import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../store/codenames_store.dart';

class TurnIndicator extends StatelessWidget {
  const TurnIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.watch<CodenamesStore>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        store.currentTurn == 0 ? "Vez da Equipe Vermelha" : "Vez da Equipe Azul",
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
