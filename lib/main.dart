import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/firebase_options.dart';
import 'package:untitled/screens/login/handler.dart';
import 'package:untitled/services/route_generator.dart';
import 'package:untitled/utilities/profile_image_notifier.dart';
import 'package:provider/provider.dart';

void main() async {
  RouteGenerator routeGenerator = RouteGenerator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ProfileImageNotifier()),
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
        // home: Handler(), // Handler()
      ),
    ),
  );
}
