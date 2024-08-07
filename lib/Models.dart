class WeatherModel {
  String description;
  double temp;
  String weatherStateName;
  double feels_like;
  int humidity;
  int visibility;
  double windSpeed;
  String sunrise;
  String sunset;

  WeatherModel({
    required this.temp,
    required this.weatherStateName,
    required this.description,
    required this.feels_like,
    required this.humidity,
    required this.visibility,
    required this.windSpeed,
    required this.sunrise,
    required this.sunset,
  });

  factory WeatherModel.fromjson(dynamic data) {
    return WeatherModel(
        description: data['weather'][0]["description"],
        temp: data["main"]["temp"],
        weatherStateName: data["weather"][0]["main"],
        feels_like: data["main"]["feels_like"],
        humidity: data["main"]["humidity"],
        visibility: data["visibility"],
        windSpeed: data["wind"]["speed"],
        sunrise:
            DateTime.fromMillisecondsSinceEpoch(data["sys"]["sunrise"] * 1000)
                .toString(),
        sunset:
            DateTime.fromMillisecondsSinceEpoch(data["sys"]["sunset"] * 1000)
                .toString());
  }

  @override
  String toString() {
    return "Weather: $description, Temperature: $temp°C, Feels Like: $feels_like , Humidity: $humidity%, Visibility: $visibility , Wind Speed: $windSpeed m/s";
  }

  String getImage() {
    if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder')
      return 'assets/images/Thunder 1.png';
    else if (weatherStateName == 'Clear' ||
        weatherStateName == 'Light Cloud' ||
        weatherStateName == 'Sunny')
      return "assets/images/sunset 2.png";
    else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail')
      return 'assets/images/sunrise 2.png';
    else if (weatherStateName == 'Heavy Cloud')
      return 'assets/images/Cloud 3.png';
    else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers' ||
        weatherStateName == 'Partly cloudy')
      return 'assets/images/Raining 1.png';
    else
      return 'assets/images/Cloud 3.png';
  }
}
