import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:listify/model/groceryList.dart';

ValueNotifier<List<GroceryListData>> groseryListNotifyr = ValueNotifier([]);

Future addGroseryData(GroceryListData values) async {
  final gBox = await Hive.openBox<GroceryListData>('groserybox');
  gBox.add(values);
  getAllgroseryData();
  groseryListNotifyr.notifyListeners();
}

Future getAllgroseryData() async {
  final gBox = await Hive.openBox<GroceryListData>('groserybox');
  groseryListNotifyr.value.clear();
  groseryListNotifyr.value.addAll(gBox.values);
  groseryListNotifyr.notifyListeners();
}

Future deleteGroseryData(int index) async {
  final gBox = await Hive.openBox<GroceryListData>('groserybox');
  gBox.deleteAt(index);
  getAllgroseryData();
}

Future editGrosery(int index, GroceryListData values) async {
  final gbox = await Hive.openBox<GroceryListData>('groserybox');
  gbox.putAt(index, values);
  getAllgroseryData();
}
