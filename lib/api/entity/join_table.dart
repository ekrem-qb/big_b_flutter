class JoinTable {
  const JoinTable({
    required this.joinFieldName,
    required this.tableName,
    required this.fieldNames,
  });

  final String joinFieldName;
  final String tableName;
  final String fieldNames;

  @override
  String toString() {
    return '$joinFieldName:$tableName($fieldNames)';
  }
}
