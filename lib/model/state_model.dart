class StateModel {
  String _name;
  int _confirmedCases;
  int _deaths;
  int _recoveredCases;

  StateModel.fromJson(Map parsedJson) {
    _name = parsedJson['loc'];
    _confirmedCases = parsedJson['confirmedCasesIndian'] +
        parsedJson['confirmedCasesForeign'];
    _deaths = parsedJson['deaths'];
    _recoveredCases = parsedJson['discharged'];
  }

  String get name => _name;
  int get deaths => _deaths;
  int get recoveredCases => _recoveredCases;
  int get confirmedCases => _confirmedCases;
  int get total => _confirmedCases + _recoveredCases + _deaths;
}
