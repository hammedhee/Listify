import 'package:hive/hive.dart';
part 'grafModel.g.dart';

@HiveType(typeId: 3)
class GrafListData {
  @HiveField(0)
  String? completed;
  @HiveField(1)
  String? notcomplete;
  GrafListData({ this.completed, this.notcomplete});
  
}
