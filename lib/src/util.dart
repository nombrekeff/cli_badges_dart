/// Padds a string on both sides to fit a specified width
///
/// ```dart
/// paddToFitWidth('test', 6); // ' test ';
/// ```
String paddToFitWidth(String? string, int? width) {
  if (string == null) return '';

  var sLength = string.length;

  if (width == null || width <= 0) {
    // one space on each side
    width = sLength + 2;
  }

  var halfWith = ((width - sLength) / 2).ceil();
  var paddStr = ' ' * halfWith;

  return paddStr + string + paddStr;
}
