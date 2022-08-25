//страница для отображения результатов запроса погоды

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/events/WeatherEvent.dart';

import '../bloc/WeatherBloc.dart';
import '../components/WeatherCard.dart';
import '../states/weather_state.dart';

class WeatherPage extends StatefulWidget {
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}
class _WeatherPageState extends State<WeatherPage> {
  _WeatherPageState();
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as String; //получение данных с предыдущей страницы
    return Scaffold(
      appBar: AppBar(title: Text("Информация о погоде"),),
      body: BlocProvider(
        create: (context)=> WeatherBloc()..add(WeatherRequested(arg)), //добавление события запроса погоды с аргументом
        child: BlocBuilder<WeatherBloc, WeatherState>( //обработка возможных состояний
          builder: (context, state) {
            if (state is WeatherLoadSuccess) { // в случае успеха
              return Center(                   //отображается карточка погоды
                child: Column(                 //и кнопка перехода на страницу с прогнозом с передачей данных
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WeatherCard(weather: state.weather),
                    TextButton(onPressed: () {
                      Navigator.pushNamed(context, '/weatherPage/ListWeatherPage', arguments: state.weatherFor3Days);
                    }, child: Text("Погода на три дня"))
                  ],
                ),
              );
            }
            if(state is WeatherLoadFailure) { //в случае каких-либо проблем(в т.ч.отсутсвия Интернета или
                                              //ошибки в названии города) выдаётся текст с ошибкой
              return Center(child: Text("Ошибка получения данных"),);
            }
            return Scaffold( //экран загрузки на время загрузки
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );

  }

}
