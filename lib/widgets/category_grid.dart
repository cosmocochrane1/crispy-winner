import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './category_item.dart';
import '../providers/categories.dart';

class CategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<Categories>(context);
    final products = categoryData.items;
    return GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, i) => ChangeNotifierProvider.value(
              value: products[i],
              child: CategoryItem(),
            ));
  }
}
