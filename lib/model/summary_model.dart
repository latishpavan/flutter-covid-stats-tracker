class SummaryModel {
  int _total;
  int _deaths;
  int _discharged;
  int _foreignCases;
  int _localCases;
  int _locationUnknown;

  SummaryModel.fromJson(Map<String, dynamic> json) {
    _total = json['total'];
    _deaths = json['deaths'];
    _discharged = json['discharged'];
    _foreignCases = json['confirmedCasesForeign'];
    _localCases = json['confirmedCasesIndian'];
    _locationUnknown = json['confirmedButLocationUnidentified'];
  }

  int get total => _total;
  int get deaths => _deaths;
  int get discharged => _discharged;
  int get foreignCases => _foreignCases;
  int get activeCases => _localCases + _foreignCases;
  int get locationUnknown => _locationUnknown;
}
