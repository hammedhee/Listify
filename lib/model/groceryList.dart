import 'package:hive/hive.dart';
 part 'groceryList.g.dart';
@HiveType(typeId: 1)
class GroceryListData {
  @HiveField(0)
  String? groceryName;
  @HiveField(1)
  String? quantity;
  @HiveField(3)
  String? catocary;
  GroceryListData(
      {required this.groceryName,
      required this.quantity,
      required this.catocary});
}
