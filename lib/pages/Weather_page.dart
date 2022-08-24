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

class Wid extends StatelessWidget {
  const Wid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}


class _WeatherPageState extends State<WeatherPage> {
  _WeatherPageState();
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text("Информация о погоде"),),
      body: BlocProvider(
        create: (context)=> WeatherBloc()..add(WeatherRequested(arg)),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoadSuccess) {
              return WeatherCard(weather: state.weather);
            }
            if(state is WeatherLoadFailure) {
              return Center(child: Text("Ошибка получения данных"),);
            }
            return Scaffold(
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
