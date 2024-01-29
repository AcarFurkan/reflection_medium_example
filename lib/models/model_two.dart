import 'package:reflection_example/reflactor/Reflector.dart';

@reflector
class ModelTwo {
  String? data;
  int? no;
  String? something;

  ModelTwo({this.data, this.no, this.something});

  ModelTwo.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    no = json['no'];
    something = json['something'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    data['no'] = no;
    data['something'] = something;
    return data;
  }
}
