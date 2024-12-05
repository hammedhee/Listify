import 'package:hive/hive.dart';
part 'groceryList.g.dart';

@HiveType(typeId: 2)
class GroceryListData {
  @HiveField(0)
  String? groceryName;
  @HiveField(1)
  String? quantity;
  @HiveField(2)
  String? catocary;
  @HiveField(3)
  bool? value;
  GroceryListData(
      {required this.groceryName,
      required this.quantity,
      required this.catocary,
      required this.value});
}
