import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    // methodCount: 0,
  ),
);

var loggerNoStack = Logger(printer: PrettyPrinter(methodCount: 0));
