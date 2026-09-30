class Recurso {
  final int id;
  final String titulo;
  final String categoria;
  final String autor;
  final String descripcion;
  final int duracion_min;
  final String nivel;
  final String tipo;

  bool favorito;
  bool completado;

  Recurso({
    required this.id,
    required this.titulo,
    required this.categoria,
    required this.autor,
    required this.descripcion,
    required this.duracion_min,
    required this.nivel,
    required this.tipo,
    this.favorito = false,
    this.completado = false,
  });
}