import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_iti/Service.dart';

import '../Cubit/WeatherCubit.dart';
import '../Models.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key});

  String? cityName;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 18, color: Colors.black),
      onChanged: (data) {
        cityName = data;
      },
      onSubmitted: (data) async {
        cityName = data;
        BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);
        BlocProvider.of<WeatherCubit>(context).cityName = cityName;
      },
      decoration: InputDecoration(
        hintText: "Search a city",
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        suffixIcon: IconButton(
            onPressed: () async {
              WeatherService service = WeatherService();
              WeatherModel weather =
                  await service.getWeather(cityName: cityName!);
              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: cityName!);
              BlocProvider.of<WeatherCubit>(context).cityName = cityName;
              Navigator.pop(context);
            },
            icon: const Icon(Icons.search)),
      ),
    );
  }
}
