import 'package:flutter/material.dart';
import 'package:thi_don_s_application2/dbHelper/mongodb.dart';
import 'package:thi_don_s_application2/presentation/home_screen_dart/home_screen.dart';
import 'package:thi_don_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:thi_don_s_application2/widgets/custom_text_form_field.dart';
import 'package:thi_don_s_application2/widgets/custom_elevated_button.dart';
import 'package:thi_don_s_application2/core/app_export.dart';
import 'package:thi_don_s_application2/presentation/welcome_screen/welcome_screen.dart'; // Import the HomeScreen where user will be redirected upon successful login

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
                    _buildEmail(context),
                    SizedBox(height: 12.v),
                    _buildPassword(context),
                    SizedBox(height: 30.v),
                    _buildLogin(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      // Customize your app bar here if needed
    );
  }

  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      hintText: "Email",
      textInputType: TextInputType.emailAddress,
    );
  }

  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
      controller: passwordController,
      hintText: "Password",
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
    );
  }

  Widget _buildLogin(BuildContext context) {
    return CustomElevatedButton(
      text: "Login",
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          String email = emailController.text;
          String password = passwordController.text;
          _loginUser(email, password, context);
        }
      },
    );
  }

  void _loginUser(String email, String password, BuildContext context) async {
    var user = await MongoDatabase.getUserByEmail(email);
    if (user != null && user.password == password) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid email or password.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
