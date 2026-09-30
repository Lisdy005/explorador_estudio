import 'package:flutter/material.dart';

import '../data/recursos_data.dart';
import '../widgets/recurso_card.dart';
import 'detalles.dart';

class Catalogo extends StatelessWidget {
  const Catalogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: recursos.length,
        itemBuilder: (context, index) {
          final recurso = recursos[index];

          return RecursoCard(
            recurso: recurso,
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