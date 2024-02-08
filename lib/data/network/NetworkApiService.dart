import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:weatherappdynamic/data/app_exceptions.dart';
import 'package:weatherappdynamic/data/network/BaseApiServices.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataExceptions("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, var data) async {
    dynamic responseJson;
    try {
      print(data);
      final response =
          await http.post(Uri.parse(url),body: data).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);

    } on SocketException {
      throw FetchDataExceptions("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestExertions(response.body.toString());
      case 415:
        UnSupportedMediaType(response.body.toString());
      case 404:
        throw UnAuthorizedExceptions(response.body.toString());
      default:
        throw FetchDataExceptions(
            'Error occurred while communicating with server ' +
                'with status code ' +
                response.statusCode.toString());
    }
  }
}
