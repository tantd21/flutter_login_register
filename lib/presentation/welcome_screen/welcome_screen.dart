import 'package:flutter/material.dart';
import 'package:thi_don_s_application2/core/app_export.dart';
import 'package:thi_don_s_application2/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:thi_don_s_application2/widgets/custom_elevated_button.dart';
import 'package:thi_don_s_application2/widgets/custom_outlined_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: appTheme.whiteA700,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgWelcome,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 22.h,
              vertical: 28.v,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgBranding,
                  height: 99.v,
                  width: 141.h,
                ),
                SizedBox(height: 43.v),
                CustomElevatedButton(
                  text: "Logine",
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.loginScreen,
                    );
                  },
                ),
                SizedBox(height: 15.v),
                CustomOutlinedButton(
                  text: "Register",
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.registerScreen,
                    );
                  },
                ),
                SizedBox(height: 47.v),
                Text(
                  "Continue as a guest",
                  style: CustomTextStyles.titleSmallCyan400.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
