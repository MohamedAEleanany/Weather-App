import 'package:dio/dio.dart';
import 'package:weater_app_using_api/weather_model.dart';

class webservices {

  final Dio dio = Dio();

  Future<WeatherModel> getWeatherData(String cityName) async{
    Response response = await dio.get('http://api.weatherapi.com/v1/forecast.json?key=2ed5f164413a41cba2e200124231309&q=$cityName&days=1&aqi=no&alerts=no');
    WeatherModel model = WeatherModel.fromJson(response.data);

    return model;
  }
}