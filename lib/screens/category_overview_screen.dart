import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as dev;

import '../screens/cart_screen.dart';

import '../widgets/category_grid.dart';
import '../widgets/badge.dart';
import '../widgets/category_item.dart';
import '../widgets/app_drawer.dart';
import '../widgets/featured_category.dart';

import '../providers/categories.dart';
import '../providers/cart.dart';

enum FilterOptions {
  Favorites,
  All,
}

class CategoryOverviewScreen extends StatefulWidget {
  static const routeName = '/category-overview-screen';

  @override
  State<CategoryOverviewScreen> createState() => _CategoryOverviewScreenState();
}

class _CategoryOverviewScreenState extends State<CategoryOverviewScreen> {
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
        setState(() {
          _isLoading = false;
        });
      }).catchError((error) {
        setState(() {
          _isLoading = false;
        });
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
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(37, 30, 59, 1),
                Color.fromRGBO(56, 60, 161, 1),
              ],
            )),
            child: _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 8.0),
                    child: Container(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Featured Category',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Expanded(child: FeaturedCategory()),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Categories',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                                Text(
                                  'Over 25 different categories',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                  fontSize: 14, color: Color.fromRGBO(161,164,178,1)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Expanded(child: CategoryGrid()),
                      ],
                    )),
                  )));
  }
}
