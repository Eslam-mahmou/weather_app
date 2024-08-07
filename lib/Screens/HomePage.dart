import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_iti/Components/CustomCard.dart';
import 'package:weather_app_iti/Components/CustomTextFormField.dart';
import 'package:weather_app_iti/Cubit/WeatherCubit.dart';
import 'package:weather_app_iti/Cubit/WeatherState.dart';
import 'package:weather_app_iti/Models.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(body: BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherSuccessState) {
          weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextFormField(),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    BlocProvider.of<WeatherCubit>(context).cityName!,
                    style: theme.textTheme.bodyLarge,
                  ),
                  Image.asset(
                    weatherData!.getImage(),
                    scale: 2,
                    alignment: Alignment.topCenter,
                  ),
                  Text(
                    "${weatherData!.temp}",
                    style: theme.textTheme.bodyMedium,
                  ),
                  Text(
                    weatherData!.weatherStateName,
                    style: theme.textTheme.bodyMedium?.copyWith(fontSize: 20),
                  ),
                  Row(
                    children: [
                      CustomCard(
                          image: "assets/images/feellike 2.png",
                          description: "feel like",
                          temperature: weatherData!.feels_like.toString()),
                      CustomCard(
                          image: "assets/images/humidity 2.png",
                          description: "humidity",
                          temperature: weatherData!.humidity.toString())
                    ],
                  ),
                  Row(
                    children: [
                      CustomCard(
                          image: "assets/images/visibility 2.png",
                          description: "visibility",
                          temperature: weatherData!.visibility.toString()),
                      CustomCard(
                          image: "assets/images/windspeed 2.png",
                          description: "Wind Speed",
                          temperature: weatherData!.windSpeed.toString())
                    ],
                  ),
                  Row(
                    children: [
                      CustomCard(
                          image: "assets/images/sunrise 2.png",
                          description: "Sun Rise",
                          temperature:weatherData!.sunrise),
                      CustomCard(
                          image: "assets/images/sunset 2.png",
                          description: "Sun Set",
                          temperature:weatherData!.sunset )
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        else if(State is WeatherFailureState){
          return const Center(child:  Text('Something went wrong please try again'));
        }
        else {
          return Padding(
              padding:const EdgeInsets.symmetric(horizontal: 16,vertical: 200),
              child: CustomTextFormField());

        }
      },
    ));
  }
}
