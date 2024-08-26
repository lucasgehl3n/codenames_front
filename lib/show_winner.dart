import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './store/codenames_store.dart';

class ShowWinner extends StatelessWidget {
  const ShowWinner({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.watch<CodenamesStore>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        Text(
          'O vencedor é: ${store.teamWinner == 1 ? 'Time Vermelho' : 'Time Azul'}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () => context.read<CodenamesStore>().resetGame(),
        ),
      ],
    );
  }
}
