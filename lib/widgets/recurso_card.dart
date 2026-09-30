import 'package:flutter/material.dart';

import '../models/recursos.dart';

class RecursoCard extends StatelessWidget {
  final Recurso recurso;
  final VoidCallback? onTap;
  final IconData icono;

  const RecursoCard({
    super.key,
    required this.recurso,
    this.onTap,
    this.icono = Icons.menu_book,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icono),
        title: Text(recurso.titulo),
        subtitle: Text(
          '${recurso.categoria} • ${recurso.nivel}',
        ),
        trailing: Text('${recurso.duracion_min} min'),
        onTap: onTap,
      ),
    );
  }
}