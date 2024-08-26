import 'package:codenames_front/player_team.dart';
import 'package:codenames_front/show_winner.dart';
import 'package:codenames_front/turn_indicator.dart';
import 'package:codenames_front/word_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'store/codenames_store.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CodenamesStore(),
      child: const CodenamesApp(),
    ),
  );
}

class CodenamesApp extends StatelessWidget {
  const CodenamesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CodenamesStore(),
      child: MaterialApp(
        title: 'Codenames',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CodenamesGameScreen(),
      ),
    );
  }
}

class CodenamesGameScreen extends StatefulWidget {
  const CodenamesGameScreen({super.key});

  @override
  _CodenamesGameScreenState createState() => _CodenamesGameScreenState();
}

class _CodenamesGameScreenState extends State<CodenamesGameScreen> {
  @override
  void initState() {
    super.initState();
    // Garantir que o jogo seja reiniciado apenas uma vez quando o widget for criado
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CodenamesStore>().resetGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CodenamesStore>(
      builder: (context, store, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Codenames'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () => context.read<CodenamesStore>().resetGame(),
              ),
            ],
          ),
          body: getExibition(),
          backgroundColor: store.playerTeam == 1
              ? Colors.red[300]
              : store.playerTeam == 2
                  ? Colors.blue[300]
                  : Colors.white,
        );
      },
    );
  }

  Widget getExibition() {
    final store = context.watch<CodenamesStore>();

    if (store.playerTeam == 0) {
      return PlayerTeamSelection();
    } else if (store.isGameOver) {
      return const ShowWinner();
    } else {
      return _gridCodenames(store);
    }
  }

  Column _gridCodenames(CodenamesStore store) {
    return Column(
      children: [
        // Exibir contadores de palavras restantes
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Palavras Restantes (Vermelho): ${store.redTeamCount}',
                  style: const TextStyle(fontSize: 16)),
              Text('Palavras Restantes (Azul): ${store.blueTeamCount}',
                  style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
        const WordGrid(),
        const TurnIndicator(),
      ],
    );
  }
}
