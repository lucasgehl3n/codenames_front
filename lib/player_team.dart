import 'package:codenames_front/store/codenames_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerTeamSelection extends StatefulWidget {
  @override
  _PlayerTeamSelectionState createState() => _PlayerTeamSelectionState();
}

class _PlayerTeamSelectionState extends State<PlayerTeamSelection> {
  int selectedTeam = 0;
  int selectedRole = 0;

  void _selectTeam(int team) {
    setState(() {
      selectedTeam = team;
    });
  }

  void _selectRole(int role) {
    setState(() {
      selectedRole = role;
    });
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<CodenamesStore>();

    void submitSelection() {
      store.setSelectedTeam(selectedTeam);
      store.setPlayerRole(selectedRole);
    }

    return Column(
      children: [
        Text('Selecione o time: ${selectedTeam == 1 ? 'Vermelho' : selectedTeam != 0 ? 'Azul' : ''}'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: const Text('Vermelho'), onPressed: () => _selectTeam(1)),
            ElevatedButton(
                child: const Text('Azul'), onPressed: () => _selectTeam(2)),
          ],
        ),
        const SizedBox(height: 16),
        Text('Selecione o time: ${selectedRole == 1 ? 'Espião' : selectedRole != 0 ? 'Jogador' : ''}'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: const Text('Espião'), onPressed: () => _selectRole(1)),
            ElevatedButton(
                child: const Text('Jogador'), onPressed: () => _selectRole(2)),
          ],
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: submitSelection,
          child: const Text('Confirmar'),
        ),
      ],
    );
  }
}
