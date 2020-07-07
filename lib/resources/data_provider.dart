import 'dart:convert';
import 'package:covid19_tracker/model/state_model_list.dart';
import 'package:covid19_tracker/model/summary_model.dart';
import 'package:http/http.dart';

class DataProvider {
  final String _url = 'https://api.rootnet.in/covid19-in/stats/latest';
  Future<Response> _dataFuture;
  bool _isApiCalled = false;

  void _fetchData() async {
    _dataFuture = get(_url);
  }

  Future<StateModelList> fetchStateWiseStats() async {
    if (!_isApiCalled) {
      _fetchData();
      _isApiCalled = true;
    }

    Response response = await _dataFuture;
    var data = jsonDecode(response.body)['data'];

    if (response.statusCode == 200) {
      return StateModelList.fromJson(data['regional']);
    } else {
      throw Exception("error loading data");
    }
  }

  Future<SummaryModel> fetchSummary() async {
    if (!_isApiCalled) {
      _fetchData();
      _isApiCalled = true;
    }

    Response response = await _dataFuture;
    var data = jsonDecode(response.body)['data'];

    if (response.statusCode == 200) {
      return SummaryModel.fromJson(data['summary']);
    } else {
      throw Exception("error loading data");
    }
  }
}
