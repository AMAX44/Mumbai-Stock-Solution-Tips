import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mumbai_stock_solution/ui/home/home.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCkw8rJQ2ta3yHrA2eoU60d2gydYt1rK3Y',
        appId: '1:743479468309:web:c0ea749e39b82f936a491c',
        messagingSenderId: '743479468309',
        projectId: 'mumbai-stock-solution-tips',
      ),
    );
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mumbai Stock Solution Tips', // Title here
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
