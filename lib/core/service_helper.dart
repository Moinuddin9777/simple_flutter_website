import 'dart:convert';
import 'package:get/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

// or new Dio with a BaseOptions instance.
Future<Dio> getDio() async {
  // var token = await getAccessToken();
  var options = BaseOptions(
    // baseUrl: 'https://www.xx.com/api',
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    contentType: "application/json",
  );
  var dio = Dio(options);
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        if (kDebugMode) logger.printError(info: dio2curl(options).toString());
        // Do something before request is sent
        return handler.next(options); //continue
        // If you want to resolve the request with some custom data，
        // you can resolve a `Response` object eg: return `dio.resolve(response)`.
        // If you want to reject the request with a error message,
        // you can reject a `DioError` object eg: return `dio.reject(dioError)`
      },
      onResponse: (response, handler) {
        // if (kDebugMode) logger.d(dio2curl(response.requestOptions));
        // Do something with response data
        return handler.next(response); // continue
        // If you want to reject the request with a error message,
        // you can reject a `DioError` object eg: return `dio.reject(dioError)`
      },
      onError: (DioError e, handler) {
        logger.printError(info: e.toString());
        // if (kDebugMode) logger.d(dio2curl(e.requestOptions));
        // Do something with response error
        return handler.next(e); //continue
        // If you want to resolve the request with some custom data，
        // you can resolve a `Response` object eg: return `dio.resolve(response)`.
      },
    ),
  );
  if (kDebugMode) {
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestHeader: false,
        responseHeader: false,
        request: false,
      ),
    );
  }

  dio.options.headers = {
    // "Authorization": "Bearer $token",
    "Content-Type": "application/json"
  };

  return dio;
}

// A simple utility function to dump `curl` from "Dio" requests
String dio2curl(RequestOptions requestOption) {
  var curl = '';

  try {
    // Add PATH + REQUEST_METHOD
    curl +=
        'curl --request ${requestOption.method} \'${requestOption.baseUrl}${requestOption.path}\'';

    // Include headers
    for (var key in requestOption.headers.keys) {
      curl += ' -H \'$key: ${requestOption.headers[key]}\'';
    }

    // Include data if there is data
    if (requestOption.data != null) {
      curl += ' --data-binary \'${json.encode(requestOption.data)}\'';
    }

    curl += ' --insecure'; //bypass https verification
  } catch (e) {
    logger.printError(info: e.toString());
  }
  return curl;
}

//////// LOG HELPER ///////////

// class Logger {
//   static Logger log = Logger();
// }

// ignore: depend_on_referenced_packages

var logger = Logger(
  printer: PrettyPrinter(),
);
