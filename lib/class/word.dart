import 'package:flutter/material.dart';

class Word {
  final String id;
  final String word;
  final int team; // 0: Sem Equipe, 1: Vermelho, 2: Azul
  int state; // 0: Não selecionado, 1: Vermelho, 2: Azul, 3: Neutro, 4: Assassinato

  Word({
    required this.id,
    required this.word,
    required this.team,
    this.state = 0, // Inicialmente não selecionado
  });

   // Método para retornar a cor correta baseado no papel do usuário
  Color getColor(bool isSpy) {
     // Se a palavra já foi clicada, retorna a cor baseada no estado
    if (state != 0) {
      return getTeamColor();
    }

    // Se não, retorna a cor baseada no papel do usuário
    return isSpy ? getTeamColor() : getStateColor();
  }

  // Retorna a cor baseada no estado atual do jogo (usado por espiões)
  Color getStateColor() {
    switch (state) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.grey;
      case 4:
        return Colors.black;
      default:
        return Colors.white;
    }
  }

Color getTeamColor() {
    switch (team) {
      case 1:
        return Colors.red; // Cor para o time vermelho
      case 2:
        return Colors.blue; // Cor para o time azul
      case 4:
        return Colors.black; // Cor para a palavra de assassinato
      default:
        return Colors.grey; // Cor para palavras inválidas
    }
  }
}
