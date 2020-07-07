import 'package:covid19_tracker/model/state_model_list.dart';
import 'package:covid19_tracker/model/summary_model.dart';
import 'package:covid19_tracker/resources/data_provider.dart';

class Repository {
  final DataProvider _covidStatsProvider = DataProvider();

  Future<StateModelList> fetchStateWiseStats() {
    return _covidStatsProvider.fetchStateWiseStats();
  }

  Future<SummaryModel> fetchSummary() {
    return _covidStatsProvider.fetchSummary();
  }
}
