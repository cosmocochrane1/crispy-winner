import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/categories.dart';

import '../screens/product_detail_screen.dart';
import '../providers/category.dart';

class FeaturedCategory extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<Categories>(context);
    return Container(
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: 1);
          },
          child: Text(
            "Masterbation",
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}

