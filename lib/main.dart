import 'package:dictionary/bloc/dictionary_cubit.dart';
import 'package:dictionary/repo/word_repo.dart';
import 'package:dictionary/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home:BlocProvider(
          create: (context)=>DictionaryCubit(WordRepository()),
          child: Home())
    );
  }
}
