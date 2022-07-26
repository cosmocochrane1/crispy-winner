import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../providers/orders.dart';

import '../widgets/cart_item.dart' as ci;

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final orders = Provider.of<Orders>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: Column(children: [
        Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Chip(
                      label: Text(cart.totalAmount.toString()),
                      backgroundColor: Theme.of(context).primaryColor),
                  TextButton(
                      child: Text('Order Now'),
                      onPressed: () {
                        orders.addOrder(
                            cart.items.values.toList(), cart.totalAmount);
                            cart.clear();
                      }),
                ],
              ),
            )),
        SizedBox(height: 10),
        Expanded(
            child: ListView.builder(
                itemBuilder: (ctx, i) => ci.CartItem(
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].id,
                    cart.items.values.toList()[i].price,
                    cart.items.values.toList()[i].quantity,
                    cart.items.values.toList()[i].title),
                itemCount: cart.itemCount))
      ]),
    );
  }
}
