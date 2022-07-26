import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:developer' as dev;

class Categories with ChangeNotifier {
  List<Category> _items = [];

  List<Category> get items {
    return [..._items];
  }

  Future getCatgories() async {
    var shit = await FirebaseFirestore.instance
        .collection('categories')
        .get();

    var poop = shit.docs;
    
    poop.forEach((DOC) {
      var item = DOC.data();
      dev.debugger();
      _items.add(
        Category.fromJson(item)
      );

      DOC.data();
    });
    print(poop);
  }

  Future fetchAndSetCategories() async {
    /// Get single document by ID

    try {
      var shit = await getCatgories();
      print(_items);
      print('THESE SHOULD BE THE ITEMS!!');
    } catch (e) {
      throw e;
    }
  }
}
