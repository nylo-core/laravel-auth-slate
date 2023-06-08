library laravel_auth_slate;

import '/stubs/auth_user_stub.dart';
import '/stubs/dashboard_stub.dart';
import '/stubs/laravel_api_service.dart';
import '/stubs/laravel_auth_event_stub.dart';
import '/stubs/laravel_auth_api_serivce_stub.dart';
import '/stubs/login_stub.dart';
import '/stubs/register_stub.dart';
import 'package:nylo_support/metro/constants/strings.dart';
import 'package:nylo_support/metro/models/ny_template.dart';

/*
|--------------------------------------------------------------------------
| Publish template files
|
| Add your stub templates inside the /stubs directory.
| Then add them into the `run` method like in the example below.
| Install the package in your project and run the below in the terminal.
| "dart run laravel_auth_slate:main publish:all"
|
| Learn more https://nylo.dev/docs/5.x/slates
|--------------------------------------------------------------------------
*/

List<NyTemplate> run() => [
      /// AUTH USER
      NyTemplate(
        name: "auth_user",
        saveTo: modelsFolder,
        pluginsRequired: [],
        stub: stubAuthUser(),
      ),

      /// LOGIN
      NyTemplate(
        name: "login_page",
        saveTo: pagesFolder,
        pluginsRequired: [],
        stub: stubLogin(),
      ),

      /// REGISTER
      NyTemplate(
        name: "register_page",
        saveTo: pagesFolder,
        pluginsRequired: [],
        stub: stubRegister(),
      ),

      /// DASHBOARD
      NyTemplate(
        name: "dashboard_page",
        saveTo: pagesFolder,
        pluginsRequired: [],
        stub: stubDashboard(),
      ),

      /// API SERVICE LOGIN
      NyTemplate(
        name: "laravel_auth_api_service",
        saveTo: networkingFolder,
        pluginsRequired: [],
        stub: stubLaravelAuthApiService(),
      ),

      /// API SERVICE GENERAL
      NyTemplate(
        name: "laravel_api_service",
        saveTo: networkingFolder,
        pluginsRequired: [],
        stub: stubLaravelApiService(),
      ),

      /// EVENT
      NyTemplate(
        name: "laravel_auth_event",
        saveTo: networkingFolder,
        pluginsRequired: [],
        stub: stubLaravelAuthEvent(),
      ),

      /// add more templates...
    ];

/*
|--------------------------------------------------------------------------
| Reference - saveTo Accepted Folders
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
