
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:newsmedia/config/constant.dart';
import 'package:newsmedia/data/services/base/endpoint.dart';
import 'package:newsmedia/injector.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

enum RequestType {GET, POST}

class BaseServices {
  late Dio _dio;
  final api = injector<APIEndpoint>();
  BaseServices() {
    _dio = Dio(BaseOptions(
      connectTimeout: 120000,
      receiveTimeout: 120000,
      queryParameters: {
        "apiKey": apiKey
      },
      contentType: 'application/json',
    ));
    /// Only show logging in debug mode
    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true
      ));
    }
  }

  /// Base service request to fetch api with parameter [url], [type]. 
  /// And also support for optional parameter like [param] for GET and  [data] for POST method
  Future<Map<String, dynamic>> request(String url, RequestType type, {Map<String, dynamic>? data, Map<String, dynamic>? param}) async {
    try {
      Response? response;
      switch(type) {
        case RequestType.GET:
          response = await _dio.get(url, queryParameters: param);
          break;
        case RequestType.POST:
          response = await _dio.post(url, data: FormData.fromMap(data!));
          break;
        default:
          break;
      }
      return json.decode(response.toString());
    } catch(e) {
      throw e.toString();
    }
  }
}