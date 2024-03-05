
// import 'dart:js';

import 'package:thi_don_s_application2/dbHelper/mongodb.dart';
import 'package:thi_don_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:thi_don_s_application2/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:thi_don_s_application2/widgets/custom_text_form_field.dart';
import 'package:thi_don_s_application2/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:thi_don_s_application2/core/app_export.dart';
import 'package:thi_don_s_application2/MongoDBModel.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;



// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 20.v),
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
                          // style: theme.textTheme.headlineLarge!.copyWith(height: 1.30),
                        ),
                      ),
                    ),
                    SizedBox(height: 31.v),
                    _buildUserName(context),
                    SizedBox(height: 12.v),
                    _buildEmail(context),
                    SizedBox(height: 12.v),
                    _buildPassword(context),
                    SizedBox(height: 12.v),
                    _buildConfirmpassword(context),
                    SizedBox(height: 30.v),
                    _buildRegister(context), // Nút đăng ký
                    SizedBox(height: 36.v),
                    // Các widget khác ở đây
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
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
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildUserName(BuildContext context) {
    return CustomTextFormField(controller: userNameController, hintText: "Username");
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      hintText: "Email",
      textInputType: TextInputType.emailAddress,
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
      controller: passwordController,
      hintText: "Password",
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
      // borderDecoration: TextFormFieldStyleHelper.outlineOnPrimaryTL8,
      // fillColor: appTheme.gray100,
    );
  }

  /// Section Widget
  Widget _buildConfirmpassword(BuildContext context) {
    return CustomTextFormField(
      controller: confirmPasswordController,
      hintText: "Confirm password",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
      // borderDecoration: TextFormFieldStyleHelper.outlineOnPrimaryTL8,
      // fillColor: appTheme.gray100,
    );
  }

  /// Section Widget
 Widget _buildRegister(BuildContext context) {
  return CustomElevatedButton(
    text: "Register",
    onPressed: () {
      if (_formKey.currentState!.validate()) {
        // _handleRegister(context);
        _insertData(userNameController.text, passwordController.text, emailController.text); // Gọi hàm xử lý đăng ký khi nhấn nút "Register"
      }
    },
  );
}

  /// Section Widget
  Widget _buildRegisterWith(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.v),
          child: SizedBox(width: 103.h, child: Divider()),
        ),
        Text(
          "Or Register with",
          // style: CustomTextStyles.titleSmallGray600,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.v),
          child: SizedBox(width: 103.h, child: Divider()),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildFour(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Các widget khác ở đây
      ],
    );
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Xử lý sự kiện đăng ký
  // void _handleRegister(BuildContext context) {
  //   // Lấy dữ liệu từ các trường nhập
  //   String username = userNameController.text;
  //   String email = emailController.text;
  //   String password = passwordController.text;

  //   // Tạo đối tượng MongoDbModel từ dữ liệu nhập
  //   MongoDbModel userData = MongoDbModel(
  //     username: username,
  //     email: email,
  //     password: password, 
  //     id: Object(),
      
  //   );

  //   // Gọi hàm insert từ file insert.dart
  //    Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => MongoDbInsert(userData: userData)),
  // );
  // }
      Future<void> _insertData(String username, String password, String email) async{
        var _id = M.ObjectId();
        final data = MongoDbModel(id : _id, username : username,email : email, password : password);
        var result = await MongoDatabase.insert(data);
        // ScaffoldMessenger.of(context as BuildContext)
        // // ignore: deprecated_member_use
        // .showSnackBar(SnackBar(content: Text("Inserted ID" + _id.$oid)));
        _clearALL();
      }
      void _clearALL(){
        userNameController.text = "";
        emailController.text = "";
        passwordController.text = "";

      }

}
