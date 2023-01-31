library my_slate_template;

import 'package:nylo_support/metro/models/ny_template.dart';

/*
|--------------------------------------------------------------------------
| Publish template files
|
| Add your stub templates inside the /stubs directory.
| Then add them into the `run` method like in the example below.
| Install the package in your project and run the below in the terminal.
| "flutter pub run my_slate_template:main publish:all"
|
| Learn more https://nylo.dev/docs/4.x/slates
|--------------------------------------------------------------------------
*/

List<NyTemplate> run() => [
      /// Example
      // NyTemplate(
      //   name: "login_page",
      //   saveTo: pagesFolder,
      //   pluginsRequired: [],
      //   stub: stubLoginPage(),
      // ),

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
