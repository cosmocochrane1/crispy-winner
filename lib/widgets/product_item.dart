import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';
import '../providers/cart.dart';


class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem({this.id, this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {

    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetailScreen.routeName, arguments: product.id);
          },
          child: GridTile(
              child: Image.network(product.imageUrl, fit: BoxFit.cover),
              footer: GridTileBar(
                leading: IconButton(
                    color: Theme.of(context).colorScheme.secondary,
                    icon: Icon(Icons.favorite),
                    onPressed: () {}),
                
                backgroundColor: Colors.black87,
                title: Text(
                  product.title,
                  textAlign: TextAlign.center,
                ),
              )),
        ),
      );
  }
}
