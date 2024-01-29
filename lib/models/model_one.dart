
import 'package:reflection_example/reflactor/reflector.dart';

@reflector
class ModelOne {
  String? difData;
  int? difNo;
  String? difSomething;

  ModelOne({this.difData, this.difNo, this.difSomething});

  ModelOne.fromJson(Map<String, dynamic> json) {
    difData = json['dif_data'];
    difNo = json['dif_no'];
    difSomething = json['dif_something'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dif_data'] = difData;
    data['dif_no'] = difNo;
    data['dif_something'] = difSomething;
    return data;
  }
}