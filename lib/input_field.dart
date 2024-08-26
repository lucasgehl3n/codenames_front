import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../store/codenames_store.dart';

class InputField extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  InputField({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<CodenamesStore>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Digite uma palavra',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              store.validateWord(_controller.text.trim());
              _controller.clear();
            },
            child: const Text('Validar Palavra'),
          ),
        ],
      ),
    );
  }
}
