import 'package:flutter/material.dart';

import 'navigator.dart';

const primaryFont = 'PrimaryFont';
const secondaryFont = 'Poppins';

double sizeFromHeight(double fraction,
    {bool removeAppBarSize = true}) {
  MediaQueryData mediaQuery = MediaQuery.of(navigatorKey.currentContext!);
  fraction = (removeAppBarSize
      ? (mediaQuery.size.height -
      AppBar().preferredSize.height -
      mediaQuery.padding.top)
      : (mediaQuery.size.height - mediaQuery.viewPadding.top)) /
      (fraction == 0 ? 1 : fraction);
  return fraction;
}

double sizeFromWidth(double fraction) {
  fraction = MediaQuery.of(navigatorKey.currentContext!).size.width / (fraction == 0 ? 1 : fraction);
  return fraction;
}