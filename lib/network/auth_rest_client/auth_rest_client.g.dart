// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AuthRestClient implements AuthRestClient {
  _AuthRestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://192.168.131.1:3000/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BaseResponse<LoginResponse>> login(
      {required email, required password}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'email': email, 'password': password};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<LoginResponse>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/users/login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<LoginResponse>.fromJson(
      _result.data!,
      (json) => LoginResponse.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
