import 'package:flutter/material.dart';

class CategoryModels {
  final String id;
  final String title;
  final Color color;
  CategoryModels(
      {required this.title, required this.id, this.color = Colors.orange});
}
