class GetsModel {
  GetsModel({
      required num userId,
      required num id,
      required String title,
      required String body,}){
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
}

  GetsModel.fromJson(dynamic json) {
    _userId = json['userId'];
    _id = json['id'];
    _title = json['title'];
    _body = json['body'];
  }
  late num _userId;
  late num _id;
  late String _title;
  late String _body;

  num get userId => _userId;
  num get id => _id;
  String get title => _title;
  String get body => _body;


}