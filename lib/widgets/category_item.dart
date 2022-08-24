import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/category_detail_screen.dart';
import '../providers/category.dart';
import '../providers/categories.dart';

class CategoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = Provider.of<Category>(context, listen: false);
    final categoriesProvider = Provider.of<Categories>(context);

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () {
            categoriesProvider.setActiveCategory(category.id);
            Navigator.of(context).pushNamed(CategoryDetailScreen.routeName,
                arguments: category.id);
          },
          child: Text(
            category.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
