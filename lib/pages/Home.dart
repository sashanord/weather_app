import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/events/WeatherEvent.dart';
import '../bloc/WeatherBloc.dart';

class Home extends StatefulWidget {
 
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _textController = TextEditingController();

  String get text => _textController.text;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Поиск по названию города'), centerTitle: true,),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: _textController,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, '/weatherPage', arguments: text);
            },
          )
        ],
      ),
    );
  }
}
