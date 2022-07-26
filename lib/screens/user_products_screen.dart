
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

import '../widgets/user_product_item.dart';
import '../widgets/app_drawer.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  Future<void> _refreshProducts(BuildContext context){
    return Provider.of<Products>(context, listen: false).fetchAndSetProducts().then((value){
      
    }).catchError((error) {

    });
  }
  
  @override
  Widget build(BuildContext context) {
    final proudctsData = Provider.of<Products>(context);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Your Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
              itemCount: proudctsData.items.length,
              itemBuilder: (_, i) => UserProductItem(
                    proudctsData.items[i].title,
                    proudctsData.items[i].imageUrl,
                  )),
        ),
      ),
    );
  }
}
