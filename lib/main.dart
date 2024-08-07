import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_iti/Cubit/WeatherCubit.dart';
import 'package:weather_app_iti/Screens/HomePage.dart';
import 'package:weather_app_iti/Service.dart';
import 'package:weather_app_iti/Utlis/appTheme.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) =>  WeatherCubit(WeatherService()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        home: HomePage(),
      ),
    );
  }
}
