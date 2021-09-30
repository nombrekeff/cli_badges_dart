import 'package:cli_badges/src/colors.dart';

void main() {
  for (var i = 0; i < 256; i++) {
    print('\u001b[${i}mBG$i\u001b[0m');
  }
}
