import 'package:hive/hive.dart';

part 'userdataModel.g.dart';

@HiveType(typeId: 1)
class UsreData {
  @HiveField(0)
  String? userName;
  @HiveField(1)
  String? passWord;
  @HiveField(2)
  String? phoneNumber;
  @HiveField(3)
  String? mailId;
  @HiveField(4)
  String? profileimagepath;
  UsreData(
      {required this.userName,
      required this.passWord,
      required this.phoneNumber,
      required this.mailId,
      this.profileimagepath});
}
