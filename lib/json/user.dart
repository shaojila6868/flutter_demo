import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class User {
  User(this.name, this.email);

  String name;
  String email;

  // JSON → Dart 객체
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // Dart 객체 → JSON
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

void main() {
  final jsonData = {
    "name" : "jicheng",
    "email" : "shaojila6868@gmail.com"
  };

  // JSON → 객체
  final user = User.fromJson(jsonData);
  print(user.name);
  print(user.email);

  // 객체 → JSON
  final jsonBack = user.toJson();
  print(jsonBack);
}