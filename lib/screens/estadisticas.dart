import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/recursos_data.dart';
import '../state/app_state.dart';

class Estadisticas extends StatelessWidget {
  const Estadisticas({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    final total = recursos.length;
    final favoritos = appState.favoritos.length;
    final completados = appState.completados.length;

    final porcentaje =
    total == 0 ? 0 : ((completados / total) * 100).round();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Estadísticas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.menu_book),
                title: const Text('Total de recursos'),
                trailing: Text('$total'),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text('Favoritos'),
                trailing: Text('$favoritos'),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.check_circle),
                title: const Text('Completados'),
                trailing: Text('$completados'),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.bar_chart),
                title: const Text('Porcentaje completado'),
                trailing: Text('$porcentaje%'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}