import 'package:flutter/material.dart';
import 'models/categorias.dart';
import 'models/mock_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Categorias')),
        body: CategoryList(categories: mockCategories),
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  final List<Categoria> categories;

  CategoryList({required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (ctx, index) {
        return ListTile(
          title: Text(categories[index].titulo),
          leading: CircleAvatar(
            backgroundColor: categories[index].color,
          ),
        );
      },
    );
  }
}
