import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weater_app_using_api/cubit.dart';
import 'package:weater_app_using_api/states.dart';
import 'package:weater_app_using_api/weather_model.dart';
import 'package:weater_app_using_api/web_services.dart';

class WeatherDataBodyUi extends StatelessWidget {
  const WeatherDataBodyUi({super.key});

  @override
  Widget build(BuildContext context) {
     var weatherModel = BlocProvider.of<DataCubit>(context).weatherModel;
    return Scaffold(
      backgroundColor: Color(0xff31319),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Weather Wave",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              style: TextStyle(color: Colors.white ,fontSize: 18),
              onSubmitted: (value) {
                 BlocProvider.of<DataCubit>(context).getData(value);
              },
              decoration: InputDecoration(
                hintText: 'Enter your City',
                  hintStyle: TextStyle(color: Colors.white54),
                  labelText: 'City Name',
                  labelStyle: TextStyle(color: Colors.white54),
                    focusColor: Colors.white54,

                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white ,)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 10 , vertical: 20),
              child: Container(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       children: [
                         Icon(Icons.location_on_outlined ,size: 28, color: Colors.white),

                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text("${weatherModel.location.name}" , style: TextStyle(color: Colors.white , fontSize: 30) , ),
                         ),
                       ],
                     ),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("Updated At : ${weatherModel.current.lastUpdated}" , style: TextStyle(color: Colors.white , fontSize: 18) , ),
                     ),
                     Expanded(
                       child: Row(
                          mainAxisSize: MainAxisSize.max,
                         crossAxisAlignment: CrossAxisAlignment.end,
                         children: [
                           Padding(
                             padding: const EdgeInsets.all(16.0),
                             child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 Text("${weatherModel.forecast.forecastday[0].day.mintempC} C" , style: TextStyle(color: Colors.white , fontSize: 50) , ),
                                 Text("${weatherModel.forecast.forecastday[0].day.mintempC} C / ${weatherModel.forecast.forecastday[0].day.maxtempC}`C " , style: TextStyle(color: Colors.white , fontSize: 18) , ),
                                 SizedBox(height: 10,),
                                 Text("${weatherModel.current.condition.text}" , style: TextStyle(color: Colors.white , fontSize: 18) , ),
                               ],
                             ),
                           ),
                              Spacer(),
                           Container(
                             width: 150,
                             height: 150,
                             child: Padding(
                               padding: const EdgeInsets.all(16.0),
                               child: Image(image: NetworkImage('https:${weatherModel.forecast.forecastday[0].day.condition.icon}', ) ,fit: BoxFit.fill,),
                             ),
                           )
                         ],
                       ),
                     )
                   ],
                 ),
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image:DecorationImage(image: AssetImage('assets/img.png') ,fit: BoxFit.fill)
                ,),

                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff16161F)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Image(image: AssetImage('assets/temp.png'), width: 25 ,height: 25,color: Colors.white54,),
                          SizedBox(width: 10,),
                          Text("Temperature" , style: TextStyle(color: Colors.white54 ,fontSize: 18),),
                          Spacer(),
                          Text("${weatherModel.forecast.forecastday[0].day.mintempC}'c" , style: TextStyle(color: Colors.white ,fontSize: 20),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.white30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Image(image: AssetImage('assets/humidity.png'), width: 25 ,height: 25,color: Colors.white54,),
                          SizedBox(width: 10,),
                          Text("Humidity" , style: TextStyle(color: Colors.white54 ,fontSize: 18),),
                          Spacer(),
                          Text("${weatherModel.current.humidity} %" , style: TextStyle(color: Colors.white ,fontSize: 20),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.white30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Image(image: AssetImage('assets/rain.png'), width: 25 ,height: 25,color: Colors.white54,),
                          SizedBox(width: 10,),
                          Text("Chance of Rain" , style: TextStyle(color: Colors.white54 ,fontSize: 18),),
                          Spacer(),
                          Text("${weatherModel.forecast.forecastday[0].day.dailyChanceOfRain} %" , style: TextStyle(color: Colors.white ,fontSize: 20),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.white30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Image(image: AssetImage('assets/wind.png'), width: 25 ,height: 25,color: Colors.white54,),
                          SizedBox(width: 10,),
                          Text("Wind" , style: TextStyle(color: Colors.white54 ,fontSize: 18),),
                          Spacer(),
                          Text("${weatherModel.current.windKph} Km/h" , style: TextStyle(color: Colors.white ,fontSize: 20),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.white30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Image(image: AssetImage('assets/air.png'), width: 25 ,height: 25,color: Colors.white54,),
                          SizedBox(width: 10,),
                          Text("Pressure" , style: TextStyle(color: Colors.white54 ,fontSize: 18),),
                          Spacer(),
                          Text("${weatherModel.current.pressureIn} In" , style: TextStyle(color: Colors.white ,fontSize: 20),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.white30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Image(image: AssetImage('assets/cloud.png'), width: 25 ,height: 25,color: Colors.white54,),
                          SizedBox(width: 10,),
                          Text("Cloud" , style: TextStyle(color: Colors.white54 ,fontSize: 18),),
                          Spacer(),
                          Text("${weatherModel.current.cloud}" , style: TextStyle(color: Colors.white ,fontSize: 20),)
                        ],
                      ),
                    ),
                  ],
                )
                ,
              ),
            )

          ],
        ),
      ),
    );
  }
}
//${weatherModel.location.name}
