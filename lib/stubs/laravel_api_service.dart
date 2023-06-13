String stubLaravelApiService() => '''
import 'package:flutter/material.dart';
import '/app/models/laravel_auth_response.dart';
import '/app/models/auth_user.dart';
import '/app/networking/dio/base_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class LaravelApiService extends BaseApiService {
  LaravelApiService({BuildContext? buildContext}) : super(buildContext);

  @override
  String get baseUrl => '\${getEnv('API_BASE_URL')}/app/v1';

  String get bearerToken => Auth.user<LaravelAuthResponse>()?.token ?? "";

  /// Example fetching the user
  Future<AuthUser?> user() async {
    return await network<AuthUser>(
        request: (request) => request.get("/user"),
        bearerToken: bearerToken
    );
  }
}
''';
