import 'package:blocstatemanagementtimespan/bloc/homescreenbloc_bloc.dart';
import 'package:blocstatemanagementtimespan/home_screen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomescreenblocBloc>(
          create: (context) => HomescreenblocBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: const HomeScreen(),
      ),
    );
  }
}
