import 'package:flutter/material.dart';
import 'package:thi_don_s_application2/core/utils/size_utils.dart';
import 'package:thi_don_s_application2/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Title text style
  
  static get titleSmallCyan400 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.cyan400,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallGray600 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray600,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallPoppinsPrimary =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallff1e232c => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFF1E232C),
      );
  static get titleSmallff34c2c1 => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFF34C2C1),
        fontWeight: FontWeight.w700,
      );
        static get bodyLargeBluegray400 => theme.textTheme.bodyLarge!.copyWith( color: appTheme.blueGray400,
);
static get bodyLarge_1 => theme.textTheme.bodyLarge!;
static get bodyMediumBluegray400 => theme.textTheme.bodyMedium!.copyWith( color: appTheme.blueGray400,
fontSize: 15.fSize,
);
static get bodyMediumBluegray400_1 => theme.textTheme.bodyMedium!.copyWith( color: appTheme.blueGray400,
);
static get bodyMedium_1 => theme.textTheme.bodyMedium!;
static get bodyMedium_2 => theme.textTheme.bodyMedium!;
static get bodyMedium_3 => theme.textTheme.bodyMedium!;
static get bodySmall10 => theme.textTheme.bodySmall!.copyWith(
fontSize: 10.fSize,
);
static get bodySmall10_1 => theme.textTheme.bodySmall!.copyWith(
fontSize: 10.fSize,
);
static get bodySmallGray900 => theme.textTheme.bodySmall!.copyWith(
color: appTheme.gray900,
);
}
extension on TextStyle {
TextStyle get sFProDisplay {
return copyWith(
fontFamily: 'SF Pro Display',
);
}
      
}

extension on TextStyle {
  // ignore: unused_element
  TextStyle get urbanist {
    return copyWith(
      fontFamily: 'Urbanist',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
