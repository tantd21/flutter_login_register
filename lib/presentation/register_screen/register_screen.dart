import 'package:thi_don_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:thi_don_s_application2/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:thi_don_s_application2/widgets/custom_text_form_field.dart';
import 'package:thi_don_s_application2/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:thi_don_s_application2/core/app_export.dart';

// ignore_for_file: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  TextEditingController userNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

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
                                              "Hello! Register to get started",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: theme
                                                  .textTheme.headlineLarge!
                                                  .copyWith(height: 1.30)))),
                                  SizedBox(height: 31.v),
                                  _buildUserName(context),
                                  SizedBox(height: 12.v),
                                  _buildEmail(context),
                                  SizedBox(height: 12.v),
                                  _buildPassword(context),
                                  SizedBox(height: 12.v),
                                  _buildConfirmpassword(context),
                                  SizedBox(height: 30.v),
                                  _buildRegister(context),
                                  SizedBox(height: 36.v),
                                  _buildRegisterWith(context),
                                  SizedBox(height: 21.v),
                                  _buildFour(context),
                                  SizedBox(height: 54.v),
                                  RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "Already have an account? ",
                                            style: CustomTextStyles
                                                .titleSmallff1e232c),
                                        TextSpan(
                                            text: "Login Now",
                                            style: CustomTextStyles
                                                .titleSmallff34c2c1)
                                      ]),
                                      textAlign: TextAlign.left),
                                  SizedBox(height: 2.v)
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
  Widget _buildUserName(BuildContext context) {
    return CustomTextFormField(
        controller: userNameController, hintText: "Username");
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
        controller: emailController,
        hintText: "Email",
        textInputType: TextInputType.emailAddress);
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
        controller: passwordController,
        hintText: "Password",
        textInputType: TextInputType.visiblePassword,
        obscureText: true,
        borderDecoration: TextFormFieldStyleHelper.outlineOnPrimaryTL8,
        fillColor: appTheme.gray100);
  }

  /// Section Widget
  Widget _buildConfirmpassword(BuildContext context) {
    return CustomTextFormField(
        controller: confirmpasswordController,
        hintText: "Confirm password",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        obscureText: true,
        borderDecoration: TextFormFieldStyleHelper.outlineOnPrimaryTL8,
        fillColor: appTheme.gray100);
  }

  /// Section Widget
  Widget _buildRegister(BuildContext context) {
    return CustomElevatedButton(text: "Register");
  }

  /// Section Widget
  Widget _buildRegisterWith(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.symmetric(vertical: 8.v),
          child: SizedBox(width: 103.h, child: Divider())),
      Text("Or Register with", style: CustomTextStyles.titleSmallGray600),
      Padding(
          padding: EdgeInsets.symmetric(vertical: 8.v),
          child: SizedBox(width: 103.h, child: Divider()))
    ]);
  }

  /// Section Widget
  Widget _buildFour(BuildContext context) {
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
