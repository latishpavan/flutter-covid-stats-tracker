import 'dart:async';

import 'package:covid19_tracker/model/state_model_list.dart';
import 'package:covid19_tracker/resources/repository.dart';
import 'package:covid19_tracker/model/summary_model.dart';

class Bloc {
  final Repository _repository = Repository();
  final StreamController _streamController = StreamController<Map>();

  fetchData() async {
    try {
      SummaryModel summaryModel = await _repository.fetchSummary();
      StateModelList stateModelList = await _repository.fetchStateWiseStats();
      _streamController.sink
          .add({
        'summary': summaryModel,
        'stateWise': stateModelList,
      });
    } catch(err) {
      _streamController.sink.addError(err);
    }
  }

  Stream get data => _streamController.stream;

  void dispose() {
    _streamController.close();
  }
}
