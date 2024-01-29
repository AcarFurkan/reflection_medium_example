// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';
import 'package:reflectable/reflectable.dart';
import 'package:reflection_example/reflactor/reflector.dart';

class BaseResponse<T> {
  final String? message;
  final T? data;

  BaseResponse(this.message, this.data);

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    var data;
    var message;

    try {
      message = json["message"] as String;
      if (T == String) {
        data = json["data"] as String;
      } else {
        var classMirror = reflector.reflectType(T) as ClassMirror;
        if (json['data'] != null && json['data'] is Map) {
          data = classMirror.newInstance(
              "fromJson", [(json['data']) as Map<String, dynamic>]) as T;
        }
      }
    } catch (e) {
      log(e.toString());
    }

    return BaseResponse(
      message,
      data,
    );
  }
}
