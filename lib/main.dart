import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/firebase_options.dart';
import 'package:untitled/screens/login/handler.dart';
import 'package:untitled/utilities/profile_image_notifier.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
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
        debugShowCheckedModeBanner: false,
        home: Handler(), // Handler()
      ),
    );
  }
}
