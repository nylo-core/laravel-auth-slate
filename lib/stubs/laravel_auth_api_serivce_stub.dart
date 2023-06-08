String stubLaravelAuthApiService() => '''
import 'package:flutter/material.dart';
import '/app/models/auth_response.dart';
import '/app/networking/dio/base_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';


class LaravelAuthApiService extends BaseApiService {
  LaravelAuthApiService({BuildContext? buildContext}) : super(buildContext);

  @override
  String get baseUrl => '\${getEnv('API_BASE_URL')}/app/v1';

  /// Login
  Future<LaravelAuthResponse?> login(String email, String password) async => await network<LaravelAuthResponse>(
    request: (request) => request.post("/login", data: {
      "email": email,
      "password": password
    }),
  );

  /// Register
  Future<LaravelAuthResponse?> register(String email, String password) async => await network<LaravelAuthResponse>(
    request: (request) => request.post("/register", data: {
      "email": email,
      "password": password
    }),
  );

  @override
  displayError(DioError dioError, BuildContext context) {
    dioError.message.dump();
  }
}
''';
