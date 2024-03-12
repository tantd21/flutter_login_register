import 'package:flutter/material.dart';
import 'package:thi_don_s_application2/presentation/home_screen_dart/home_screen.dart';
import '../presentation/welcome_screen/welcome_screen.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/register_screen/register_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String welcomeScreen = '/welcome_screen';

  static const String loginScreen = '/login_screen';

  static const String registerScreen = '/register_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String homeScreen = '/home_screen';

  static Map<String, WidgetBuilder> routes = {
    welcomeScreen: (context) => WelcomeScreen(),
    loginScreen: (context) => LoginScreen(),
    registerScreen: (context) => RegisterScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    homeScreen : (context) => HomeScreen()

  };

    // Hàm để điều hướng đến màn hình đăng nhập
  static void goToLogin(BuildContext context) {
    Navigator.pushNamed(context, loginScreen);
  }

  // Hàm để điều hướng đến màn hình đăng ký
  static void goToRegister(BuildContext context) {
    Navigator.pushNamed(context, registerScreen);
  }
}
