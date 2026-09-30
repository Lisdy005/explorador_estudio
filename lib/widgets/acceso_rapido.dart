import 'package:flutter/material.dart';

class AccesoRapido extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final VoidCallback onTap;

  const AccesoRapido({
    super.key,
    required this.icono,
    required this.titulo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Icon(
                  icono,
                  size: 32,
                  color: Theme.of(context).colorScheme.primary,
                ),

                const SizedBox(height: 8),

                Text(
                  titulo,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}