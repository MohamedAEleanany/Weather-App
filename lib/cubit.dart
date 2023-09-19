import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weater_app_using_api/states.dart';
import 'package:weater_app_using_api/weather_model.dart';
import 'package:weater_app_using_api/web_services.dart';

class DataCubit extends Cubit<states>{
  DataCubit() : super(NoDataState());




  late WeatherModel weatherModel;
   getData(String cityName)async{

     weatherModel = await webservices().getWeatherData(cityName);
      emit(dataState());
      
    }


}