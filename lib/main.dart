import 'package:flutter/material.dart';
import 'package:local_event_finder/presentation/providers/event_provider.dart';
import 'package:local_event_finder/presentation/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';

import 'data/service/event_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(

      create: (context)=> EventProvider(EventService()),
      child: MaterialApp(
        title: 'Flutter Demo',
      
        home: const SplashScreen(),
      ),
    );
  }
}

