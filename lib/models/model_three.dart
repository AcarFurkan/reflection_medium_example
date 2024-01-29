import 'package:reflection_example/reflactor/Reflector.dart';

@reflector
class ModelThree {
  String? difDataTwo;
  int? difNoTwo;
  String? difSomethingTwo;

  ModelThree({this.difDataTwo, this.difNoTwo, this.difSomethingTwo});

  ModelThree.fromJson(Map<String, dynamic> json) {
    difDataTwo = json['dif_data_two'];
    difNoTwo = json['dif_no_two'];
    difSomethingTwo = json['dif_something_two'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dif_data_two'] = difDataTwo;
    data['dif_no_two'] = difNoTwo;
    data['dif_something_two'] = difSomethingTwo;
    return data;
  }
}
