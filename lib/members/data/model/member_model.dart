import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/member_entity.dart';

part "member_model.g.dart";

@JsonSerializable()
class MemberModel extends Member {
  const MemberModel(
      {required super.id,
      required super.email,
      required super.club,
      required super.classification,
      required super.image,
      required super.name,
      required super.phone});
  factory MemberModel.fromJson(Map<String, dynamic> json) =>
      _$MemberModelFromJson(json);

  Map<String, dynamic> toJson() => _$MemberModelToJson(this);
}
