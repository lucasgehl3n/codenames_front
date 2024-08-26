import 'package:codenames_front/class/word.dart';
import 'package:flutter/material.dart';

class CodenamesStore extends ChangeNotifier {
  List<Word?> words = [
    // Time Vermelho
    Word(id: '1', word: 'Sun', team: 1),
    Word(id: '3', word: 'Star', team: 1),
    Word(id: '5', word: 'Earth', team: 1),
    Word(id: '7', word: 'Water', team: 1),
    Word(id: '9', word: 'Tree', team: 1),

    // Time Azul
    Word(id: '2', word: 'Moon', team: 2),
    Word(id: '4', word: 'Sky', team: 2),
    Word(id: '6', word: 'Fire', team: 2),
    Word(id: '8', word: 'Wind', team: 2),
    Word(id: '10', word: 'Mountain', team: 2),

    // Palavras Neutras/Inválidas
    Word(id: '11', word: 'River', team: 0),
    Word(id: '12', word: 'Cloud', team: 0),
    Word(id: '13', word: 'Sand', team: 0),
    Word(id: '14', word: 'Stone', team: 0),
    Word(id: '15', word: 'Ocean', team: 0),
    Word(id: '16', word: 'Fish', team: 0),
    Word(id: '17', word: 'Bird', team: 0),
    Word(id: '18', word: 'Lion', team: 0),
    Word(id: '19', word: 'Tiger', team: 0),
    Word(id: '20', word: 'Snake', team: 0),
    Word(id: '21', word: 'Dog', team: 0),
    Word(id: '22', word: 'Cat', team: 0),
    Word(id: '23', word: 'Horse', team: 0),
    Word(id: '24', word: 'Elephant', team: 0),

    // Palavra de Assassinato
    Word(id: '25', word: 'Frog', team: 4),
  ];

  int redTeamCount = 5; // Inicialmente 5 palavras para o time vermelho
  int blueTeamCount = 5; // Inicialmente 5 palavras para o time azul
  bool isGameOver = false; // Flag para verificar se o jogo acabou

  int currentTurn = 0;
  int teamWinner = 0;
  int playerRole = 0;
  int playerTeam = 0;

  void resetGame() {
    for (var word in words) {
      word!.state = 0; // Reset the state of each word
    }
    redTeamCount = 5;
    blueTeamCount = 5;
    isGameOver = false;
    teamWinner = 0;
    playerRole = 0;
    playerTeam = 0;
    currentTurn = 0;
    words.shuffle();
    notifyListeners();
  }

  void validateWord(String enteredWord) {
    final word = words.firstWhere(
        (w) => w!.word.toLowerCase() == enteredWord.toLowerCase(),
        orElse: () => null);

    if (word != null && word.state == 0) {
      if (validateEndGameByDeath(word)) {
        return;
      }

      validateWordDecrease(word);

      if (validateEndGameByCount(word)) {
        return;
      }

      notifyListeners();
    }
  }

  bool validateEndGameByDeath(Word word) {
    if (word.team == 4) {
      // Palavra de assassinato
      isGameOver = true;

      // Determina o time vencedor
      teamWinner = currentTurn == 0 ? 2 : 1;
      notifyListeners();
      return true;
    }
    return false;
  }

  bool validateEndGameByCount(Word word) {
    if (redTeamCount == 0) {
      isGameOver = true;
      teamWinner = 1;
      notifyListeners();
      return true;
    }

    if (blueTeamCount == 0) {
      isGameOver = true;
      teamWinner = 2;
      notifyListeners();
      return true;
    }
    return false;
  }

  void validateWordDecrease(Word word) {
    if (word.team == 1) {
      redTeamCount--;
    } else if (word.team == 2) {
      blueTeamCount--;
    }
    if (playerTeam != word.team) {
      // Troca o turno
      currentTurn = 1 - currentTurn;
    }
  }

  void setSelectedTeam(int team) {
    playerTeam = team;
    notifyListeners();
  }

  void setPlayerRole(int role) {
    playerRole = role;
    notifyListeners();
  }
}
