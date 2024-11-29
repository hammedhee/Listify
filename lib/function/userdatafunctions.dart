import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:listify/model/userdataModel.dart';

ValueNotifier<List<UsreData>> userDataNotifire = ValueNotifier([]);
Future addUserData(UsreData values) async {
  final userDataBox = await Hive.openBox<UsreData>('userdeteals');
  await userDataBox.add(values);
  getAllUserData();
}

Future getAllUserData() async {
  final userDataBox = await Hive.openBox<UsreData>('userdeteals');
  userDataNotifire.value.clear();
  userDataNotifire.value.addAll(userDataBox.values);
  userDataNotifire.notifyListeners();
}

Future editUserData(int index, UsreData values) async {
  final userDataBox = await Hive.openBox<UsreData>('userdeteals');
  userDataBox.putAt(index, values);
  getAllUserData();
}
