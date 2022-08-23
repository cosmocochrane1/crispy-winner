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
    _items = [];
    var firebaseReturn = await FirebaseFirestore.instance
        .collection('categories')
        .get();

    var categories = firebaseReturn.docs;
    
    categories.forEach((DOC) {
      var item = DOC.data();
      _items.add(
        Category.fromJson(item)
      );

      DOC.data();
    });
    
    return _items;
  }

  Future fetchAndSetCategories() async {
    /// Get single document by ID
    try {
      await getCatgories();
    } catch(error){
      print(error);
    }
  }
}
