final _regex = RegExp('([A-Z])|([^a-zA-Z0-9])');

/// Extensions getters on [String] to preform common, identifier-related
/// conversions.
extension CaseHelper on String {
  /// Returns `this` converted to
  /// [snake_case](https://en.wikipedia.org/wiki/Snake_case),
  /// where words are separated by underscore.
  ///
  /// Examples:
  ///
  /// ```text
  /// 'simple'   -> 'simple',
  /// 'twoWords' -> 'two_words'
  /// 'FirstBig' -> 'first_big'
  /// ```
  String toSnakeCase() {
    return _fixCase('_');
  }

  String _fixCase(final String separator) {
    return replaceAllMapped(_regex, (final match) {
      final upper = match.group(1);
      if (upper != null) {
        var lower = upper.toLowerCase();

        if (match.start > 0) {
          lower = '$separator$lower';
        }

        return lower;
      }

      final whitespace = match.group(2);
      if (whitespace != null) {
        return '';
      }

      return match.group(0)!;
    });
  }
}
