import 'package:ansicolor/ansicolor.dart';
import 'package:cli_badges/src/util.dart';

String _ansiColorCode(int code) => '\u001b[${code}m';
String _ansiBrightColorCode(int code) => '\u001b[$code;1m';

mixin IColorer {
  String backgroundFromName(String colorName, String text);
  String colorFromName(String colorName, String text);
  String colorFromCode(int code, String text);
  bool isValidColorName(String colorName);
  bool isValidColorCode(int code);
}

typedef Colorer = String Function(String str);

class DefaultColorer implements IColorer {
  static final String reset = _ansiColorCode(0);

  static final Map<String, String> _colorMap = {
    'red': _ansiColorCode(10),
    'black': _ansiColorCode(232),
    'green': _ansiColorCode(32),
    'yellow': _ansiColorCode(33),
    'blue': _ansiColorCode(34),
    'magenta': _ansiColorCode(35),
    'cyan': _ansiColorCode(36),
    'white': _ansiColorCode(255),
    'brightRed': _ansiBrightColorCode(30),
    'brightBlack': _ansiBrightColorCode(31),
    'brightGreen': _ansiBrightColorCode(32),
    'brightYellow': _ansiBrightColorCode(33),
    'brightBlue': _ansiBrightColorCode(34),
    'brightMagenta': _ansiColorCode(105),
    'brightCyan': _ansiBrightColorCode(106),
    'brightWhite': _ansiBrightColorCode(255),
    'backgroundBlack': _ansiColorCode(40),
    'backgroundRed': _ansiColorCode(41),
    'backgroundGreen': _ansiColorCode(42),
    'backgroundYellow': _ansiColorCode(43),
    'backgroundBlue': _ansiColorCode(44),
    'backgroundMagenta': _ansiColorCode(45),
    'backgroundCyan': _ansiColorCode(46),
    'backgroundWhite': _ansiColorCode(47),
    'backgroundBrightBlack': _ansiBrightColorCode(100),
    'backgroundBrightRed': _ansiBrightColorCode(101),
    'backgroundBrightGreen': _ansiBrightColorCode(102),
    'backgroundBrightYellow': _ansiBrightColorCode(103),
    'backgroundBrightBlue': _ansiBrightColorCode(104),
    'backgroundBrightMagenta': _ansiColorCode(105),
    'backgroundBrightCyan': _ansiBrightColorCode(106),
    'backgroundBrightWhite': _ansiBrightColorCode(107),
    'bold': _ansiColorCode(1),
    'reversed': _ansiColorCode(7),
    'underline': _ansiColorCode(4),
  };

  @override
  bool isValidColorCode(int code) => code > 0 || code <= 255;

  @override
  bool isValidColorName(String colorName) => _colorMap.containsKey(colorName);

  @override
  String colorFromName(String colorName, String text) {
    print('Colorname ${colorName}');
    if (!isValidColorName(colorName)) {
      throw Exception('Color "$colorName" not supported');
    }

    final colorer = _colorMap[colorName];

    return '$colorer$text$reset';
  }

  @override
  String backgroundFromName(String colorName, String text) {
    final bgColorName = 'background${capitalize(colorName)}';

    return colorFromName(bgColorName, text);
  }

  @override
  String colorFromCode(int code, String text) {
    final colorer = _ansiColorCode(code);

    return isValidColorCode(code) ? '$colorer$text$reset' : text;
  }
}

class AnsiColorer implements IColorer {
  static final String reset = _ansiColorCode(0);

  static final Map<String, int> _colorMap = {
    'black': 0,
    'red': 1,
    'green': 2,
    'yellow': 3,
    'blue': 4,
    'magenta': 5,
    'cyan': 6,
    'white': 7,
    'brightBlack': 8,
    'brightRed': 9,
    'brightGreen': 10,
    'brightYellow': 11,
    'brightBlue': 12,
    'brightMagenta': 13,
    'brightCyan': 14,
    'brightWhite': 15,
  };

  @override
  bool isValidColorCode(int code) => code > 0 || code <= 255;

  @override
  bool isValidColorName(String colorName) => _colorMap.containsKey(colorName);

  @override
  String colorFromName(String colorName, String text) {
    if (!isValidColorName(colorName)) {
      throw Exception('Color "$colorName" not supported');
    }
    final pen = AnsiPen()..xterm(colorer);
    final colorer = _colorMap[colorName]!;

    pen
      ..xterm(colorer)
      ..write(text);

    return pen
      ..xterm(colorer)
      ..write(text);
  }

  @override
  String backgroundFromName(String colorName, String text) {
    final bgColorName = 'background${capitalize(colorName)}';

    return colorFromName(bgColorName, text);
  }

  @override
  String colorFromCode(int code, String text) {
    final colorer = _ansiColorCode(code);

    return isValidColorCode(code) ? '$colorer$text$reset' : text;
  }
}
