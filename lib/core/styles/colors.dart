import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppColors {
  static final kBgColor = HexColor('#F7F6FC');
  static final kPurple = HexColor('#6A78FE');
  static final kLightPurple = HexColor('#868FE7');
  static final kGrey = HexColor('#777777');
  static final kLightGrey = HexColor('#D1D1D3');
  static final kGreen = HexColor('#1ED23B');
  static final kWhite = HexColor('#FFFFFF');
  static final kBlack = HexColor('#000000');

  static final kGradient = LinearGradient(
  colors: [ HexColor('#7966FF'), HexColor('#868FE7'), HexColor('#9EB7FF') ],
  begin: Alignment.bottomLeft,
  end: Alignment.bottomRight,
);
 static final sGradient = LinearGradient(
  colors: [ HexColor('#5E6FEF'), HexColor('#868FE7'), HexColor('#9EB7FF') ],
  begin: Alignment.topLeft,
  end: Alignment.topRight,
);

static final tGradient = LinearGradient(
  colors: [ HexColor('#0022FF'), HexColor('#868FE7'), HexColor('#9DD3CF') ],
  begin: Alignment.topLeft,
  end: Alignment.topRight,
);

static final animGradient = LinearGradient(
  colors: [ HexColor('#868FE7'), HexColor('#9DD3CF') ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

}