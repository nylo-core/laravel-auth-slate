import 'dart:io';

import 'package:my_slate_template/metro/metro.dart' as metro_cli;
import 'package:nylo_support/metro/metro_console.dart';

void main(List<String> arguments) async {
  var time = Stopwatch();
  bool hasDebugFlag = arguments.contains("--debug");
  if (hasDebugFlag == true) {
    time.start();
    arguments.removeWhere((element) => element == "--debug");
  }
  await metro_cli.commands(arguments);
  if (hasDebugFlag == true) {
    time.stop();
    MetroConsole.writeInBlack(
        'Time: ${time.elapsed.inMilliseconds} Milliseconds');
  }
  exit(0);
}
