import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weater_app_using_api/data_body_ui.dart';
import 'package:weater_app_using_api/weather_model.dart';
import 'package:weater_app_using_api/web_services.dart';

import 'cubit.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text('push'),
        onPressed: ()async{
         //  await BlocProvider.of<DataCubit>(context).getData();
          Navigator.push(context, MaterialPageRoute(builder: (_)=> WeatherDataBodyUi()));
        },
      ),
    );
  }
}
