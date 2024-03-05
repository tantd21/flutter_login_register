import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/app_export.dart';
import 'package:thi_don_s_application2/dbHelper/mongodb.dart';



var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await MongoDatabase.connect();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'thi_don_s_application2',
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.welcomeScreen,
            routes: AppRoutes.routes,
            // home: RegisterScreen(),
        );
      },
    );
  }
}
