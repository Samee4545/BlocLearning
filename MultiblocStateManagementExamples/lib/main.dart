import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multibloc/Repository/faourite_repositoroy.dart';
import 'package:multibloc/Utils/image_picker_util.dart';
import 'package:multibloc/Views/favourite_list_app.dart';
import 'package:multibloc/bloc/ImagepickerBloc/image_picker_bloc.dart';
import 'package:multibloc/bloc/List_bloc/list_bloc.dart';
import 'package:multibloc/bloc/favourite_list_bloc/favouriteListBloc.dart';
import 'package:multibloc/bloc/switch_bloc/switchbloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => SwitchBloc()),
          BlocProvider(create: (_) => ImagePickerBloc(imagePickerUtils())),
          BlocProvider(create: (_) => ToDoBloc()),
          BlocProvider(create: (_) => FavouriteBloc(favouriteRepository()))
        ],
        child: MaterialApp(
          title: "Flutter Demo",
          debugShowCheckedModeBanner: false,
          home:
              FavouriteListScreen(), //Provide screen of exapmle which you want to execute
        ));
  }
}
