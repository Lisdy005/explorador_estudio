import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../data/recursos_data.dart';
import '../state/app_state.dart';
import '../widgets/acceso_rapido.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    final totalRecursos = recursos.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Explorador de Recursos'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bienvenido',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Explora recursos para aprender Flutter y Android.',
            ),

            const SizedBox(height: 20),

            const Text(
              'Accesos rápidos',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                AccesoRapido(
                  icono: Icons.menu_book,
                  titulo: 'Catálogo',
                  onTap: () => context.push('/catalogo'),
                ),

                AccesoRapido(
                  icono: Icons.favorite,
                  titulo: 'Favoritos',
                  onTap: () => context.push('/favoritos'),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                AccesoRapido(
                  icono: Icons.bar_chart,
                  titulo: 'Progreso',
                  onTap: () => context.push('/progreso'),
                ),

                AccesoRapido(
                  icono: Icons.analytics,
                  titulo: 'Estadísticas',
                  onTap: () => context.push('/estadisticas'),
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              'Estadísticas rápidas',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total recursos: $totalRecursos',
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Favoritos: ${appState.favoritos.length}',
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Completados: ${appState.completados.length}',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}