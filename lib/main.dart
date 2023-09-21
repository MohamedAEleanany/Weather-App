import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weater_app_using_api/cubit.dart';
import 'package:weater_app_using_api/data_body_ui.dart';
import 'package:weater_app_using_api/nodata.dart';
import 'package:weater_app_using_api/states.dart';
import 'package:weater_app_using_api/web_services.dart';

void main() async {

  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      DataCubit(NoDataState()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<DataCubit, states>(
          builder: (context, state) {
            if(state is NoDataState){

              return Center(child: CircularProgressIndicator());
            }else
              return WeatherDataBodyUi();
          },
        ),
      ),
    );
  }
}

/*
BlocBuilder<DataCubit, states>(
          builder: (context, state) {
            if(state is NoDataState){
              BlocProvider.of<DataCubit>(context).getData('cairo');
              return Center(child: CircularProgressIndicator());
            }else
            return WeatherDataBodyUi();
          },
        ),
 */

