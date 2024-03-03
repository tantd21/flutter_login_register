import 'package:thi_don_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:thi_don_s_application2/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:thi_don_s_application2/widgets/custom_text_form_field.dart';
import 'package:thi_don_s_application2/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:thi_don_s_application2/core/app_export.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Center(
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 22.h, vertical: 20.v),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                          width: 272.h,
                                          margin: EdgeInsets.only(right: 58.h),
                                          child: Text(
                                              "Welcome back! Glad to see you, Again!",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: theme
                                                  .textTheme.headlineLarge!
                                                  .copyWith(height: 1.30)))),
                                  SizedBox(height: 26.v),
                                  CustomTextFormField(
                                      controller: emailController,
                                      hintText: "Enter your email",
                                      textInputType:
                                          TextInputType.emailAddress),
                                  SizedBox(height: 15.v),
                                  CustomTextFormField(
                                      controller: passwordController,
                                      hintText: "Enter your password",
                                      textInputAction: TextInputAction.done,
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      suffix: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              30.h, 17.v, 16.h, 17.v),
                                          child: CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgFluenteye20filled,
                                              height: 22.adaptSize,
                                              width: 22.adaptSize)),
                                      suffixConstraints:
                                          BoxConstraints(maxHeight: 56.v),
                                      obscureText: true,
                                      contentPadding: EdgeInsets.only(
                                          left: 18.h, top: 19.v, bottom: 19.v),
                                      borderDecoration: TextFormFieldStyleHelper
                                          .outlineOnPrimaryTL8,
                                      fillColor: appTheme.gray100),
                                  SizedBox(height: 16.v),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Text("Forgot Password?",
                                          style: CustomTextStyles
                                              .titleSmallGray600)),
                                  SizedBox(height: 29.v),
                                  CustomElevatedButton(text: "Login"),
                                  SizedBox(height: 36.v),
                                  _buildLoginWith(context),
                                  SizedBox(height: 21.v),
                                  _buildTwo(context),
                                  Spacer(),
                                  SizedBox(height: 2.v),
                                  RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "Don’t have an account? ",
                                            style: CustomTextStyles
                                                .titleSmallff1e232c),
                                        TextSpan(
                                            text: "Register Now",
                                            style: CustomTextStyles
                                                .titleSmallff34c2c1)
                                      ]),
                                      textAlign: TextAlign.left)
                                ])))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: double.maxFinite,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.fromLTRB(22.h, 7.v, 312.h, 7.v),
            onTap: () {
              onTapArrowLeft(context);
            }));
  }

  /// Section Widget
  Widget _buildLoginWith(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.symmetric(vertical: 8.v),
          child: SizedBox(width: 112.h, child: Divider())),
      Text("Or Login with", style: CustomTextStyles.titleSmallGray600),
      Padding(
          padding: EdgeInsets.symmetric(vertical: 8.v),
          child: SizedBox(width: 111.h, child: Divider()))
    ]);
  }

  /// Section Widget
  Widget _buildTwo(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
          height: 56.v,
          width: 105.h,
          padding: EdgeInsets.symmetric(horizontal: 36.h, vertical: 14.v),
          decoration: AppDecoration.outlineOnPrimary
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
          child: CustomImageView(
              imagePath: ImageConstant.imgFacebookIc,
              height: 26.adaptSize,
              width: 26.adaptSize,
              alignment: Alignment.centerLeft)),
      Container(
          height: 56.v,
          width: 105.h,
          padding: EdgeInsets.symmetric(horizontal: 36.h, vertical: 14.v),
          decoration: AppDecoration.outlineOnPrimary
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
          child: CustomImageView(
              imagePath: ImageConstant.imgGoogleIc,
              height: 26.adaptSize,
              width: 26.adaptSize,
              alignment: Alignment.centerLeft)),
      Container(
          height: 56.v,
          width: 105.h,
          padding: EdgeInsets.symmetric(horizontal: 36.h, vertical: 14.v),
          decoration: AppDecoration.outlineOnPrimary
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
          child: CustomImageView(
              imagePath: ImageConstant.imgCibApple,
              height: 26.adaptSize,
              width: 26.adaptSize,
              alignment: Alignment.centerLeft))
    ]);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
