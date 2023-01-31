library metro;

import 'dart:io';

import 'package:args/args.dart';
import 'package:collection/collection.dart';
import 'package:nylo_support/metro/constants/strings.dart';
import 'package:nylo_support/metro/metro_console.dart';
import 'package:nylo_support/metro/metro_service.dart';
import 'package:nylo_support/metro/models/ny_command.dart';
import 'package:nylo_support/metro/models/ny_template.dart';
import '/my_slate_template.dart';
import '/metro/menu.dart';

final ArgParser parser = ArgParser(allowTrailingOptions: true);
List<NyCommand> _allCommands = [
  NyCommand(
      name: "all",
      options: 1,
      arguments: ["-h", "-f"],
      category: "publish",
      action: _publishAll),
];

Future<void> commands(List<String> arguments) async {
  if (arguments.isEmpty) {
    MetroConsole.writeInBlack(metroMenu);
    return;
  }

  List<String> argumentSplit = arguments[0].split(":");

  if (argumentSplit.isEmpty || argumentSplit.length <= 1) {
    MetroConsole.writeInBlack('Invalid arguments ${arguments.toString()}');
    exit(2);
  }

  String type = argumentSplit[0];
  String action = argumentSplit[1];

  NyCommand? nyCommand = _allCommands.firstWhereOrNull(
      (command) => type == command.category && command.name == action);

  if (nyCommand == null) {
    MetroConsole.writeInBlack('Invalid arguments ${arguments.toString()}');
    exit(1);
  }

  arguments.removeAt(0);
  await nyCommand.action!(arguments);
}

_publishAll(List<String> arguments) async {
  parser.addFlag(helpFlag,
      abbr: 'h', help: 'Publish all the files from this package.', negatable: false);
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
