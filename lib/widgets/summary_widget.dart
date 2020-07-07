import 'package:covid19_tracker/model/summary_model.dart';
import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  final SummaryModel summaryModel;
  final TextStyle _style = TextStyle(fontSize: 18.0);

  Summary(this.summaryModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.deepPurpleAccent),
      padding: EdgeInsets.all(15.0),
      child: DefaultTextStyle(
        style: TextStyle(color: Colors.white70),
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(children: <Widget>[
                    Text(
                      'TOTAL',
                      style: _style,
                    ),
                    Text(summaryModel.total.toString())
                  ]),
                  Column(children: <Widget>[
                    Text(
                      'DEATHS',
                      style: _style,
                    ),
                    Text(summaryModel.deaths.toString())
                  ]),
                  Column(children: <Widget>[
                    Text(
                      'ACTIVE',
                      style: _style,
                    ),
                    Text(summaryModel.activeCases.toString())
                  ]),
                  Column(children: <Widget>[
                    Text(
                      'RECVRD',
                      style: _style,
                    ),
                    Text(summaryModel.discharged.toString())
                  ])
                ])
          ],
        ),
      ),
    );
  }
}
