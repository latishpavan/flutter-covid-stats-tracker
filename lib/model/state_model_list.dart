import 'package:covid19_tracker/model/state_model.dart';

class StateModelList {
  List<StateModel> _stateModels;

  StateModelList.fromJson(List<dynamic> items) {
    _stateModels = items.map((item) => StateModel.fromJson(item)).toList();
  }

  List<StateModel> get statesList => _stateModels;
}
