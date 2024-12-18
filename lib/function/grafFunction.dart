import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:listify/model/grafModel.dart';

ValueNotifier<List<GrafListData>> grafnotyfire = ValueNotifier([]);
Future addgrafData(GrafListData values) async {
  final grafbox = await Hive.openBox<GrafListData>('grafbox');
  grafbox.add(values);
  getGrafData();
  grafnotyfire.notifyListeners();
}

Future getGrafData() async {
  final grafbox = await Hive.openBox<GrafListData>('grafbox');
  grafnotyfire.value.clear();
  grafnotyfire.value.addAll(grafbox.values);
  grafnotyfire.notifyListeners();
}

Future cleargrafdata() async {
  final grafbox = await Hive.openBox<GrafListData>('grafbox');
  grafbox.clear();
  grafnotyfire.notifyListeners();
}
