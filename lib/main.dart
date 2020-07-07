import 'dart:async';

import 'package:covid19_tracker/blocs/bloc.dart';
import 'package:covid19_tracker/widgets/state_wise_table.dart';
import 'package:covid19_tracker/widgets/summary_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      title: 'COVID-19 India',
      theme: ThemeData(
          brightness: Brightness.light, primaryColor: Colors.deepPurple),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final Bloc _bloc = Bloc();
  Timer _timer;
  int _duration = 2;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
        Duration(seconds: _duration), (Timer t) => _bloc.fetchData());
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 India Tracker'),
      ),
      body: Container(
        child: Center(
          child: StreamBuilder(
            stream: _bloc.data,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map data = snapshot.data;
                return Column(children: [
                  Summary(data['summary']),
                  StateWiseTable(data['stateWise'])
                ]);
              }
              if (snapshot.hasError) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error loading data',
                          style: TextStyle(fontSize: 20.0)),
                      SizedBox(
                        height: 10.0,
                      ),
                      RaisedButton(
                          child: Text('Refresh'), onPressed: _handleRefresh)
                    ]);
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  void _handleRefresh() {
    _bloc.fetchData();
  }
}
