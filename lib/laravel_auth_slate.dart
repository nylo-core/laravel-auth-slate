library laravel_auth_slate;

import '/stubs/login_form.dart';
import '/stubs/register_form.dart';
import '/stubs/landing_stub.dart';
import '/stubs/forgot_password_controller_stub.dart';
import '/stubs/forgot_password_stub.dart';
import '/stubs/login_controller_stub.dart';
import '/stubs/register_controller_stub.dart';
import '/stubs/laravel_auth_response.dart';
import '/stubs/auth_user_stub.dart';
import '/stubs/dashboard_stub.dart';
import '/stubs/laravel_api_service.dart';
import '/stubs/laravel_auth_event_stub.dart';
import '/stubs/laravel_auth_api_serivce_stub.dart';
import '/stubs/login_stub.dart';
import '/stubs/register_stub.dart';
import 'package:nylo_support/metro/constants/strings.dart';
import 'package:nylo_support/metro/models/ny_template.dart';

/* Publish template files
|--------------------------------------------------------------------------
| Add your stub templates inside the /stubs directory.
| Then add them into the `run` method like in the example below.
| Install the package in your project and run the below in the terminal.
| "dart run laravel_auth_slate:main publish:all"
|
| Learn more https://nylo.dev/docs/5.20.0/slates
|-------------------------------------------------------------------------- */

List<NyTemplate> run() => [
      /// MODELS
      NyTemplate(
        name: "auth_user",
        saveTo: modelsFolder,
        pluginsRequired: ["nylo_framework"],
        stub: stubAuthUser(),
      ),

      NyTemplate(
        name: "laravel_auth_response",
        saveTo: modelsFolder,
        pluginsRequired: ["nylo_framework"],
        stub: stubLaravelAuthResponseModel(),
      ),

      /// PAGES
      NyTemplate(
        name: "landing_page",
        saveTo: pagesFolder,
        pluginsRequired: ["nylo_framework"],
        stub: stubLandingPage(),
      ),

      NyTemplate(
        name: "login_page",
        saveTo: pagesFolder,
        pluginsRequired: ["nylo_framework"],
        stub: stubLogin(),
      ),

      NyTemplate(
        name: "register_page",
        saveTo: pagesFolder,
        pluginsRequired: ["nylo_framework"],
        stub: stubRegister(),
      ),

      NyTemplate(
        name: "forgot_password_page",
        saveTo: pagesFolder,
        pluginsRequired: ["nylo_framework"],
        stub: stubForgotPassword(),
      ),

      NyTemplate(
          name: "dashboard_page",
          saveTo: pagesFolder,
          pluginsRequired: ["nylo_framework"],
          stub: stubDashboard(),
          options: {"is_auth_page": true}),

      /// CONTROLLERS
      NyTemplate(
        name: "login_controller",
        saveTo: controllersFolder,
        pluginsRequired: ["nylo_framework"],
        stub: stubLoginController(),
      ),

      NyTemplate(
        name: "register_controller",
        saveTo: controllersFolder,
        pluginsRequired: ["nylo_framework"],
        stub: stubRegisterController(),
      ),

      NyTemplate(
        name: "forgot_password_controller",
        saveTo: controllersFolder,
        pluginsRequired: ["nylo_framework"],
        stub: stubForgotPasswordController(),
      ),

      /// API SERVICES
      NyTemplate(
        name: "laravel_auth_api_service",
        saveTo: networkingFolder,
        pluginsRequired: ["nylo_framework"],
        stub: stubLaravelAuthApiService(),
      ),

      NyTemplate(
        name: "laravel_api_service",
        saveTo: networkingFolder,
        pluginsRequired: ["nylo_framework"],
        stub: stubLaravelApiService(),
      ),

      /// EVENTS
      NyTemplate(
        name: "laravel_auth_event",
        saveTo: eventsFolder,
        pluginsRequired: ["nylo_framework"],
        stub: stubLaravelAuthEvent(),
      ),

      /// FORMS
      NyTemplate(
        name: "register_form",
        saveTo: formsFolder,
        pluginsRequired: [],
        stub: stubRegisterForm(),
      ),

      NyTemplate(
        name: "login_form",
        saveTo: formsFolder,
        pluginsRequired: [],
        stub: stubLoginForm(),
      ),
    ];

/*
|--------------------------------------------------------------------------
| Directory Reference
|
| controllersFolder = 'lib/app/controllers';
| widgetsFolder = 'lib/resources/widgets';
| pagesFolder = 'lib/resources/pages';
| modelsFolder = 'lib/app/models';
| themesFolder = 'lib/resources/themes';
| providerFolder = 'lib/app/providers';
| eventsFolder = 'lib/app/events';
| networkingFolder = 'lib/app/networking';
| themeColorsFolder = 'lib/resources/themes/styles';
|--------------------------------------------------------------------------
*/
