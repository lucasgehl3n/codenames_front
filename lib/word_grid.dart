import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../store/codenames_store.dart';

class WordGrid extends StatelessWidget {
  const WordGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.watch<CodenamesStore>();

    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: store.words.length,
        itemBuilder: (context, index) {
          final word = store.words[index];
          return GestureDetector(
            onTap: () => store.validateWord(word.word),
            child: Card(
              color: word!.getColor(store.playerRole == 1),
              child: Center(
                child: Text(
                  word.word,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: word.state == 0 ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
