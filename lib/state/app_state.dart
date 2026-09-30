import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  final Set<int> favoritos = {};

  final Set<int> completados = {};

  void alternarFavorito(int id) {
    if (favoritos.contains(id)) {
      favoritos.remove(id);
    } else {
      favoritos.add(id);
    }

    notifyListeners();
  }

  void alternarCompletado(int id) {
    if (completados.contains(id)) {
      completados.remove(id);
    } else {
      completados.add(id);
    }

    notifyListeners();
  }

  bool esFavorito(int id) {
    return favoritos.contains(id);
  }

  bool estaCompletado(int id) {
    return completados.contains(id);
  }
}