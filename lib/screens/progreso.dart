import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/recursos_data.dart';
import '../state/app_state.dart';

class Progreso extends StatelessWidget {
  const Progreso({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    final completados = appState.completados.length;
    final total = recursos.length;

    final recursosCompletados = recursos
        .where((recurso) => appState.estaCompletado(recurso.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Progreso'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mi progreso',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              'Recursos completados: $completados de $total',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            LinearProgressIndicator(
              value: total == 0 ? 0 : completados / total,
            ),

            const SizedBox(height: 25),

            const Text(
              'Recursos completados',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: recursosCompletados.isEmpty
                  ? const Center(
                child: Text(
                  'Todavía no has completado recursos.',
                ),
              )
                  : ListView.builder(
                itemCount: recursosCompletados.length,
                itemBuilder: (context, index) {
                  final recurso = recursosCompletados[index];

                  return Card(
                    child: ListTile(
                      leading: const Icon(
                        Icons.check_circle,
                      ),
                      title: Text(recurso.titulo),
                      subtitle: Text(recurso.categoria),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}