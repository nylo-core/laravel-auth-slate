library metro;
import 'package:args/args.dart';
import 'package:nylo_support/metro/constants/strings.dart';
import 'package:nylo_support/metro/metro_service.dart';
import 'package:nylo_support/metro/models/ny_command.dart';
import 'package:nylo_support/metro/models/ny_template.dart';
import '/laravel_auth_slate.dart';

final ArgParser parser = ArgParser(allowTrailingOptions: true);
List<NyCommand> allCommands = [
  NyCommand(
      name: "all",
      options: 1,
      arguments: ["-h", "-f"],
      category: "publish",
      action: _publishAll,
  ),
];

_publishAll(List<String> arguments) async {
  parser.addFlag(helpFlag,
      abbr: 'h',
      help: 'Publish all the files from this package.',
      negatable: false);
  parser.addFlag(forceFlag,
      abbr: 'f',
      help: 'Creates new widgets even if they already exist.',
      negatable: false);

  final ArgResults argResults = parser.parse(arguments);

  bool? hasForceFlag = argResults[forceFlag];

  MetroService.hasHelpFlag(argResults[helpFlag], parser.usage);

  List<NyTemplate> templates = run();
  await MetroService.createSlate(templates, hasForceFlag: hasForceFlag);
}
