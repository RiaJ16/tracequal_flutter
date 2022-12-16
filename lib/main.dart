import 'package:flutter/material.dart';
import 'package:tracequal/inicio_de_sesion.dart';
import 'package:tracequal/registro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        //scaffoldBackgroundColor: const Color(0xFFE6E6E6),
      ),
      initialRoute: '/login',
      routes: {
        //'/proyectos': (context) => const Proyectos(),
        '/login': (context) => const InicioDeSesion(),
        '/registro': (context) => const Registro(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
