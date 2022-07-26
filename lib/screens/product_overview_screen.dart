import 'package:flutter/material.dart';
import '../providers/cart.dart';
import '../screens/cart_screen.dart';
import 'package:provider/provider.dart';
import '../widgets/product_item.dart';
import '../widgets/app_drawer.dart';

import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/categories.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _isLoading = true;
      Provider.of<Categories>(context).fetchAndSetCategories().then((_) {
        _isLoading = false;
      });
    }

    _isInit = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text('MyShop'),
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              ) 
            : Text('Should be done loading'));
  }
}
