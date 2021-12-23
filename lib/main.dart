import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveller/cubit/app_cubits.dart';
import 'package:traveller/cubit/app_cubits_logics.dart';
import 'package:traveller/pages/detail_page.dart';
import 'package:traveller/pages/navpages/main_page.dart';
import 'package:traveller/pages/welcome_page.dart';
import 'package:traveller/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Traveller",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: BlocProvider<AppCubits>(
        create: (contex) => AppCubits(
          data: DataServices(),
        ),
        child: AppCubitLogics(),
      ),
    );
  }
}
