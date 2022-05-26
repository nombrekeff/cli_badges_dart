/// Padds a string on both sides to fit a specified width
///
/// ```dart
/// paddToFitWidth('test', 6); // ' test ';
/// ```
String paddToFitWidth(String? string, int? width) {
  if (string == null) return '';
  if (width != null && width <= 0) {
    throw ArgumentError.value(
      width,
      'width',
      'must be greater than 0',
    );
  }

  final stringLength = string.length;

  int effectiveWidth = width ?? 0;
  if (width == null || width <= 0) {
    // add one space on each side
    effectiveWidth = stringLength + 2;
  }

  final halfWith = ((effectiveWidth - stringLength) / 2).ceil();
  final paddStr = ' ' * halfWith;

  return paddStr + string + paddStr;
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
