import 'package:flutter/material.dart';

class Categoria {
  final String id;
  final String titulo;
  final Color color;

  const Categoria ({
    required this.id,
    required this.titulo,
    this.color = Colors.orange,
  });

}