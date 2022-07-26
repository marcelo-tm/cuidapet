import 'package:cuidapet/app/core/helpers/constants.dart';
import 'package:cuidapet/app/core/helpers/environments.dart';
import 'package:cuidapet/app/core/rest_client/rest_client.dart';
import 'package:cuidapet/app/core/rest_client/rest_client_exception.dart';
import 'package:cuidapet/app/core/rest_client/rest_client_response.dart';
import 'package:dio/dio.dart';

class DioRestClient implements RestClient {
  late final Dio _dio;
  final _defaultOptions = BaseOptions(
    baseUrl: Environments.param(Constants.ENV_BASE_URL_KEY) ?? '',
    connectTimeout: int.parse(
        Environments.param(Constants.ENV_REST_CLIENT_CONNECT_TIMEOUT) ?? '0'),
    receiveTimeout: int.parse(
        Environments.param(Constants.ENV_REST_CLIENT_RECEIVE_TIMEOUT) ?? '0'),
  );

  DioRestClient({
    BaseOptions? baseOptions,
  }) {
    _dio = Dio(baseOptions ?? _defaultOptions);
  }

  @override
  RestClient auth() {
    _defaultOptions.extra['auth_required'] = true;
    return this;
  }

  @override
  RestClient unauth() {
    _defaultOptions.extra['auth_required'] = false;
    return this;
  }

  @override
  Future<RestClientResponse<T>> delete<T>(String path,
      {data,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.delete(path,
          data: data,
          queryParameters: queryParams,
          options: Options(
            headers: headers,
          ));

      return _dioResponseConverter(response);
    } on DioError catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(String path,
      {Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.get<T>(path,
          queryParameters: queryParams,
          options: Options(
            headers: headers,
          ));

      return _dioResponseConverter(response);
    } on DioError catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> patch<T>(String path,
      {data,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.patch<T>(path,
          data: data,
          queryParameters: queryParams,
          options: Options(
            headers: headers,
          ));

      return _dioResponseConverter(response);
    } on DioError catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> post<T>(String path,
      {data,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.post<T>(path,
          data: data,
          queryParameters: queryParams,
          options: Options(
            headers: headers,
          ));

      return _dioResponseConverter(response);
    } on DioError catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(String path,
      {data,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.put<T>(path,
          data: data,
          queryParameters: queryParams,
          options: Options(
            headers: headers,
          ));

      return _dioResponseConverter(response);
    } on DioError catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> request<T>(String path,
      {required String method,
      data,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.request<T>(path,
          data: data,
          queryParameters: queryParams,
          options: Options(
            headers: headers,
            method: method,
          ));

      return _dioResponseConverter(response);
    } on DioError catch (e) {
      _throwRestClientException(e);
    }
  }
}

Future<RestClientResponse<T>> _dioResponseConverter<T>(
    Response<dynamic> response) async {
  return RestClientResponse<T>(
    data: response.data,
    statusCode: response.statusCode,
    statusMessage: response.statusMessage,
  );
}

Never _throwRestClientException(DioError dioError) {
  final response = dioError.response;

  throw RestClientException(
    error: dioError.error,
    message: response?.statusMessage,
    statusCode: response?.statusCode,
    response: RestClientResponse(
      data: response?.data,
      statusCode: response?.statusCode,
      statusMessage: response?.statusMessage,
    ),
  );
}
