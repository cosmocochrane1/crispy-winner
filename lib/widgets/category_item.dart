import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/category.dart';

class CategoryItem extends StatelessWidget {
  // final String id;
  final String title;
  // final String imageUrl;

  CategoryItem({this.title: ''});

  @override
  Widget build(BuildContext context) {
    final category = Provider.of<Category>(context, listen: false);
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
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
