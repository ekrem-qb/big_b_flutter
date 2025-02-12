import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.pascal)
enum Role {
  employee,
  manager
}
