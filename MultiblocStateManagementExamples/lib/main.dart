import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multibloc/bloc/switch_bloc/switchbloc.dart';
import 'package:multibloc/ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (_) => SwitchBloc())],
        child: MaterialApp(
          title: "Flutter Demo",
          home: HomeScreen(),
        ));
  }
}
