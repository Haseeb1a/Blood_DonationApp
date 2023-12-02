import 'package:blooddonation3/controller/add_controller.dart';
import 'package:blooddonation3/controller/update.controller.dart';
import 'package:blooddonation3/services/firebase_options.dart';
import 'package:blooddonation3/view/list_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AddController(),
        ),
        ChangeNotifierProvider(
          create: (context) => UpdateController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Color.fromARGB(255, 158, 37, 28),
              centerTitle: true),
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        home: UsersList(),
      ),
    );
  }
}
