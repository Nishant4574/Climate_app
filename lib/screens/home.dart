import 'dart:ui';

import 'package:climate_app/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MainApp extends StatelessWidget {
  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300 :
        return Image.asset(
            'assets/1.png'
        );
      case >= 300 && < 400 :
        return Image.asset(
            'assets/2.png'
        );
      case >= 500 && < 600 :
        return Image.asset(
            'assets/3.png'
        );
      case >= 600 && < 700 :
        return Image.asset(
            'assets/4.png'
        );
      case >= 700 && < 800 :
        return Image.asset(
            'assets/5.png'
        );
      case == 800 :
        return Image.asset(
            'assets/6.png'
        );
      case > 800 && <= 804 :
        return Image.asset(
            'assets/7.png'
        );
      default:
        return Image.asset(
            'assets/7.png'
        );
    }
  }
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            systemNavigationBarColor: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepPurple.shade500),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepPurple.shade500),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(color: Colors.deepOrange.shade400),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 100.0,
                  sigmaY: 100.0,
                ),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBloc, WeatherState>(
  builder: (context, state) {
    if(state is FetechSuccess) {
      return SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "📍${state.weather.areaName}",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "${state.weather.weatherDescription!.toUpperCase()}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
     getWeatherIcon(state.weather.weatherConditionCode!),
            Center(
              child: Text(
                 "${state.weather.temperature!.celsius!.round()}°C",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 55,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Center(
              child: Text(
                "${state.weather.weatherMain!.toUpperCase()}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text(DateFormat(
"EEEE dd ."
              ).add_jm().format(state.weather.date!),

                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/11.png",
                      scale: 8,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("Sunrise"
                        , style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(DateFormat().add_jm().format(state.weather.sunrise!),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700
                          ),
                        )

                      ],
                    ),
                    SizedBox(
                      width: 55,
                    ),
                    Row(

                      children: [
                        Image.asset(
                          "assets/12.png",
                          scale: 8,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text("Sunset"
                            , style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(DateFormat(

                            ).add_jm().format(state.weather.sunset!),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700
                              ),
                            )

                          ],
                        )


                      ],
                    ),


                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 7,),
                  child: Divider(
                    color: Colors.grey.shade500,
                  ),
                ), Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(

                      children: [
                        Image.asset(
                          "assets/13.png",
                          scale: 10,
                        ),
                        SizedBox(
                          width: 0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text("Temp Max"
                            , style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                            SizedBox(
                              height: 3,
                            ),
                            Text("${state.weather.tempMax!.celsius!.round()}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700
                              ),
                            )

                          ],
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        Row(

                          children: [
                            Image.asset(
                              "assets/14.png",
                              scale: 8,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Text("Temp Min "
                                , style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                                SizedBox(
                                  height: 0,
                                ),
                                Text("${state.weather.tempMin!.celsius!.round()}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700
                                  ),
                                )

                              ],
                            )


                          ],
                        ),


                      ],
                    ),
                  ),
                ),


              ],
            )
          ],
        ),
      );
    }else{
      return Container();
    }
  },
)
            ],
          ),
        ),
      ),
    );
  }
}
