import 'package:braucoe/providers/chat_provider.dart';
import 'package:braucoe/screens/login/logo_screen.dart';
import 'package:flutter/material.dart';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:provider/provider.dart';

import 'package:braucoe/providers/ai_chat_provider.dart';
import 'package:braucoe/utilities/env.dart';
import 'package:braucoe/firebase_options.dart';
import 'package:braucoe/screens/login/handler.dart';
import 'package:braucoe/services/route_generator.dart';
import 'package:braucoe/providers/profile_image_notifier.dart';

void main() async {
  RouteGenerator routeGenerator = RouteGenerator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Gemini.init(apiKey: Env.geminiAPIKey);
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => ProfileImageNotifier()),
          ChangeNotifierProvider(create: (ctx) => AIChatProvider()),
          ChangeNotifierProvider(create: (ctx) => ChatProvider()),
        ],
        child: MaterialApp(
          theme: ThemeData().copyWith(
            textTheme: ThemeData().textTheme.copyWith(
                  bodyMedium: const TextStyle(
                    fontFamily: 'LibreFranklin-Regular',
                    color: Color(0xFF382E1E),
                  ),
                ),
          ),
          title: "University-BRAU",
          onGenerateRoute: routeGenerator.generateRoute,
          debugShowCheckedModeBanner: false,
          initialRoute: Handler.routeName,
        ),
      ),
    ),
  );
}
