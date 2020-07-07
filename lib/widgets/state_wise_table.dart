import 'package:covid19_tracker/model/state_model_list.dart';
import 'package:flutter/material.dart';

class StateWiseTable extends StatelessWidget {
  final StateModelList stateModelList;
  final TextStyle _style = TextStyle(fontSize: 17.0);

  StateWiseTable(this.stateModelList);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.count(
        crossAxisCount: 2,
        children: _buildGridTiles(context),
      ),
    );
  }

  _buildGridTiles(context) {
    return stateModelList.statesList.map((stateList) {
      var width = MediaQuery.of(context).size.width;

      return Card(
        color: Colors.black,
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: width / 100),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(stateList.name.split(' ')[0],
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'Total: ${stateList.total}',
                          style: _style,
                        ),
                        Text(
                          'Active: ${stateList.confirmedCases}',
                          style: _style,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'Deaths: ${stateList.deaths}',
                          style: _style,
                        ),
                        Text(
                          'Recvrd: ${stateList.recoveredCases}',
                          style: _style,
                        )
                      ],
                    )
                  ])));
    }).toList();
  }
}
