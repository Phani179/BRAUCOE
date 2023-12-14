import 'package:flutter/material.dart';
import 'package:braucoe/screens/class_details/class_details.dart';
import 'package:braucoe/screens/forgot_password/forgot_password.dart';
import 'package:braucoe/screens/forgot_password/otp_page.dart';
import 'package:braucoe/screens/forgot_password/reset_password_page.dart';
import 'package:braucoe/screens/help/help.dart';
import 'package:braucoe/screens/home_page/home_page.dart';
import 'package:braucoe/screens/login/screen2.dart';
import 'package:braucoe/screens/login/student_login.dart';
import 'package:braucoe/screens/results/result_home_screen.dart';
import '../screens/login/handler.dart';


class RouteGenerator {
  Route? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    print(settings.name);
    switch (settings.name) {
      case Handler.routeName:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Handler.routeName),
          builder: (ctx) => Handler(),
        );
      case Screen2.routeName:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Screen2.routeName),
          builder: (ctx) => const Screen2(),
        );
      case StudentLogin.routeName:
        return MaterialPageRoute(
          settings: const RouteSettings(name: StudentLogin.routeName),
          builder: (ctx) => StudentLogin(),
        );
      case HelpScreen.routeName:
        return MaterialPageRoute(
          settings: const RouteSettings(name: HelpScreen.routeName),
          builder: (ctx) => HelpScreen(),
        );
      case ForgotPassword.routeName:
        return MaterialPageRoute(
          settings: const RouteSettings(name: ForgotPassword.routeName),
          builder: (ctx) => ForgotPassword(),
        );
      case OtpPage.routeName:
        return MaterialPageRoute(
          settings: const RouteSettings(name: OtpPage.routeName),
          builder: (ctx) => OtpPage(reg_no: args as int),
        );
      case ResetPassword.routeName:
        return MaterialPageRoute(
          settings: const RouteSettings(name: ResetPassword.routeName),
          builder: (ctx) => ResetPassword(),
        );
      case HomePage.routeName:
        return MaterialPageRoute(
          settings: const RouteSettings(name: HomePage.routeName),
          builder: (ctx) => HomePage(),
        );
      case ClassDetailsScreen.routeName:
        return MaterialPageRoute(
          settings: const RouteSettings(name: ClassDetailsScreen.routeName),
          builder: (ctx) => const ClassDetailsScreen(),
        );
      case ResultHomeScreen.routeName:
        return MaterialPageRoute(
          settings: const RouteSettings(name: ResultHomeScreen.routeName),
          builder: (ctx) => const ResultHomeScreen(),
        );
      default:
        return null;
    }
  }
}
