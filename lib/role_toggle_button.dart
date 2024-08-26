import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../store/codenames_store.dart';

class RoleToggleButton extends StatelessWidget {
  const RoleToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CodenamesStore>(
      builder: (context, store, child) {
        return const Text('');
        // return ElevatedButton(
        //   onPressed: () {
        //     store.toggleRole(); // Alterna o papel e notifica os ouvintes
        //   },
        //   child: Text(store.isSpy ? 'Tornar Jogador' : 'Tornar Espião'),
        // );
      },
    );
  }
}
