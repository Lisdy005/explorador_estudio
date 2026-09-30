import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/recursos_data.dart';
import '../state/app_state.dart';
import '../widgets/recurso_card.dart';
import 'detalles.dart';

class Favoritos extends StatelessWidget {
  const Favoritos({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    final favoritos = recursos
        .where((recurso) => appState.esFavorito(recurso.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: favoritos.isEmpty
          ? const Center(
        child: Text(
          'No tienes recursos favoritos.',
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: favoritos.length,
        itemBuilder: (context, index) {
          final recurso = favoritos[index];

          return RecursoCard(
            recurso: recurso,
            icono: Icons.favorite,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Detalles(
                    recurso: recurso,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}