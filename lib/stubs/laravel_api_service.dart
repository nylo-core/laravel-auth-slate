String stubLaravelApiService() => '''
import 'package:flutter/material.dart';
import '/config/decoders.dart';
import '/app/models/laravel_auth_response.dart';
import '/app/models/auth_user.dart';
import 'package:nylo_framework/nylo_framework.dart';

/* LaravelApiService
| -------------------------------------------------------------------------
| API Service for your authenticated users
| Learn more https://nylo.dev/docs/5.20.0/networking
|-------------------------------------------------------------------------- */

class LaravelApiService extends NyApiService {
  LaravelApiService({BuildContext? buildContext}) : super(buildContext, decoders: modelDecoders);

  @override
  String get baseUrl => '\${getEnv('API_BASE_URL')}/app/v1';

  String get bearerToken => Auth.user<LaravelAuthResponse>()?.token ?? "";

  /// Fetch auth users information
  Future<AuthUser?> user() async {
    return await network<AuthUser>(
        request: (request) => request.get("/user"),
        bearerToken: bearerToken
    );
  }
}
''';
