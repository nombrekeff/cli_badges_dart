import 'package:cli_badges/src/badge_theme.dart';
import 'package:cli_badges/src/util.dart';

class Badge {
  static inline(
    List<Badge> badges, {
    String separator = ' ',
    int separation = 2,
  }) {
    assert(separation > 0, 'Separation must be a positive number');

    return badges.join(separator * separation);
  }

  final String label;
  final String? message;
  final BadgeTheme theme;
  final int? labelWidth;
  final int? messageWidth;

  Badge({
    required this.label,
    this.message,
    this.labelWidth,
    this.messageWidth,
    BadgeTheme? theme,
  }) : theme = theme ?? BadgeTheme.primary;

  Badge.red({
    required this.label,
    this.message,
    this.labelWidth,
    this.messageWidth,
  }) : theme = BadgeTheme.red;

  Badge.failed({
    required this.label,
    this.message,
    this.labelWidth,
    this.messageWidth,
  }) : theme = BadgeTheme.red;

  Badge.green({
    required this.label,
    this.message,
    this.labelWidth,
    this.messageWidth,
  }) : theme = BadgeTheme.green;

  Badge.success({
    required this.label,
    this.message,
    this.labelWidth,
    this.messageWidth,
  }) : theme = BadgeTheme.green;

  Badge.blue({
    required this.label,
    this.message,
    this.labelWidth,
    this.messageWidth,
  }) : theme = BadgeTheme.blue;

  Badge.info({
    required this.label,
    this.message,
    this.labelWidth,
    this.messageWidth,
  }) : theme = BadgeTheme.blue;

  Badge.yellow({
    required this.label,
    this.message,
    this.labelWidth,
    this.messageWidth,
  }) : theme = BadgeTheme.yellow;

  Badge.warning({
    required this.label,
    this.message,
    this.labelWidth,
    this.messageWidth,
  }) : theme = BadgeTheme.yellow;

  Badge.magenta({
    required this.label,
    this.message,
    this.labelWidth,
    this.messageWidth,
  }) : theme = BadgeTheme.magenta;

  Badge.cyan({
    required this.label,
    this.message,
    this.labelWidth,
    this.messageWidth,
  }) : theme = BadgeTheme.cyan;

  Badge red() => copyWith(theme: BadgeTheme.red);
  Badge green() => copyWith(theme: BadgeTheme.green);
  Badge blue() => copyWith(theme: BadgeTheme.blue);
  Badge yellow() => copyWith(theme: BadgeTheme.yellow);
  Badge magenta() => copyWith(theme: BadgeTheme.magenta);
  Badge cyan() => copyWith(theme: BadgeTheme.cyan);
  Badge success() => copyWith(theme: BadgeTheme.green);
  Badge failed() => copyWith(theme: BadgeTheme.red);
  Badge info() => copyWith(theme: BadgeTheme.blue);
  Badge warning() => copyWith(theme: BadgeTheme.yellow);

  Badge copyWith({
    String? label,
    String? message,
    int? labelWidth,
    int? messageWidth,
    BadgeTheme? theme,
  }) {
    return Badge(
      label: label ?? this.label,
      message: message ?? this.message,
      labelWidth: labelWidth ?? this.labelWidth,
      messageWidth: messageWidth ?? this.messageWidth,
      theme: theme ?? this.theme,
    );
  }

  swapped() {
    return Badge(
      label: label,
      message: message,
      labelWidth: labelWidth,
      messageWidth: messageWidth,
      theme: theme.swapped(),
    );
  }

  String _getLabel() {
    return paddToFitWidth(label, labelWidth);
  }

  String _getMessage() {
    return paddToFitWidth(message, messageWidth);
  }

  @override
  toString() {
    var label = _getLabel();
    var message = _getMessage();

    var coloredLabel = theme.colorLabel(label);
    var coloredMessage = theme.colorMessage(message);

    return '$coloredLabel$coloredMessage';
  }
}
