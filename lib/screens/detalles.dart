import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/recursos.dart';
import '../state/app_state.dart';

class Detalles extends StatelessWidget {
  final Recurso recurso;

  const Detalles({
    super.key,
    required this.recurso,
  });

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    final esFavorito = appState.esFavorito(recurso.id);
    final estaCompletado = appState.estaCompletado(recurso.id);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recurso.titulo,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (esFavorito)
                  const Chip(
                    avatar: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 18,
                    ),
                    label: Text('Favorito'),
                  ),

                if (estaCompletado)
                  const Chip(
                    avatar: Icon(
                      Icons.check_circle,
                      size: 18,
                    ),
                    label: Text('Completado'),
                  ),
              ],
            ),

            const SizedBox(height: 20),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Categoría: ${recurso.categoria}'),
                    const SizedBox(height: 8),

                    Text('Autor: ${recurso.autor}'),
                    const SizedBox(height: 8),

                    Text('Nivel: ${recurso.nivel}'),
                    const SizedBox(height: 8),

                    Text('Tipo: ${recurso.tipo}'),
                    const SizedBox(height: 8),

                    Text('Duración: ${recurso.duracion_min} min'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Descripción',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              recurso.descripcion,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  appState.alternarFavorito(recurso.id);
                },
                icon: Icon(
                  esFavorito
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: esFavorito ? Colors.red : null,
                ),
                label: Text(
                  esFavorito
                      ? 'Quitar de favoritos'
                      : 'Agregar a favoritos',
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  appState.alternarCompletado(recurso.id);
                },
                icon: Icon(
                  estaCompletado
                      ? Icons.check_circle
                      : Icons.check_circle_outline,
                ),
                label: Text(
                  estaCompletado
                      ? 'Marcar como pendiente'
                      : 'Marcar como completado',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}