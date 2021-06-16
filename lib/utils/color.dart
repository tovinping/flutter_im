import 'dart:ui';

class HexColor extends Color {
  HexColor(String value) : super(_getColorFromHex(value));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toLowerCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
