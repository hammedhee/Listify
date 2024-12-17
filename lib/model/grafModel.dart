import 'package:hive/hive.dart';
part 'grafModel.g.dart';     
@HiveType(typeId: 3)
class GrafListData {
  @HiveField(0)
  bool? grafValue;
  GrafListData({required this.grafValue});
}
