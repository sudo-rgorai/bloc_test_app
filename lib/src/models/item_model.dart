class ItemModel {
  String? _status;
  List<String>? _breeds = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    _status = parsedJson['status'];
    List<String>? tmp = [];
    for (String key in parsedJson['message'].keys) {
      tmp.add(key);
    }
    _breeds = tmp;
  }

  List<String>? get breeds => _breeds;
  String? get status => _status;

}