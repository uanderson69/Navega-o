import 'package:flutter/material.dart';
import '../componentes/produto_item.dart';
import '../models/produtos.dart';

class TelaProdutos extends StatefulWidget {
  static const routeName = '/produtos';
  final List<Produto> produtosValidos;
  TelaProdutos(this.produtosValidos);

  @override
  State<TelaProdutos> createState() => _TelaProdutosState();
}

class _TelaProdutosState extends State<TelaProdutos> {
  String? tituloCategoria;
  List<Produto>? displayProdutos;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    tituloCategoria = routeArgs['title']!;
    final categoryId = routeArgs['id'];
    displayProdutos = widget.produtosValidos.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     displayedMeals!.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tituloCategoria!)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return ItemProduto(
            id: displayProdutos![index].id,
            title: displayProdutos![index].title,
            imageUrl: displayProdutos![index].imageUrl,
            duration: displayProdutos![index].duration,
            cost: displayProdutos![index].cost,
          );
          // return Text(displayedMeals[index].title);
        },
        itemCount: displayProdutos!.length,
      ),
    );
  }
}
