import 'dart:developer';
import 'package:reflectable/reflectable.dart';
import 'package:reflection_example/reflactor/reflector.dart';

class BaseResponseList<T> {
  final String? message;
  final List<T>? data;
  BaseResponseList(this.message, this.data);
  factory BaseResponseList.fromJson(Map<String, dynamic> json) {
    List<T>? data;
    String? message;
    try {
      message = json["message"] as String?;
      var classMirror = reflector.reflectType(T) as ClassMirror;
      if (json['data'] != null && json['data'] is List) {
        data = (json['data'] as List).map((e) {
          return classMirror
              .newInstance("fromJson", [(e) as Map<String, dynamic>]) as T;
        }).toList();
      }
    } catch (e) {
      log(e.toString());
    }
    return BaseResponseList(
      message,
      data,
    );
  }
}
