import 'dart:developer';

import 'package:logger/logger.dart';

final _logger = Logger(
    // output: ConsoleOutput(),
    );

bool get _showBLOC => true;
bool get _showAppRouter => true;
bool get _showRestApi => true;
bool get _showChangeNotifier => true;
bool get _showFirebase => true;
bool get _showErrors => true;

void logData(dynamic data) => _logger.t(data);

void logInfo(dynamic data) => _logger.i(data);

void logError(dynamic data, [dynamic error, StackTrace? stackTrace]) =>
    _showErrors ? _logger.e(data, error: error, stackTrace: stackTrace) : null;

// BLOC logs
void logBlOC(dynamic data) => _showBLOC ? _logger.i(data) : null;
void logErrorBlOC(dynamic data, [dynamic error, StackTrace? stackTrace]) =>
    _showBLOC ? _logger.e(data, error: error, stackTrace: stackTrace) : null;

// APP ROUTER logs
void logAppRouter(dynamic data) => _showAppRouter ? _logger.i(data) : null;
void logErrorAppRouter(dynamic data, [dynamic error, StackTrace? stackTrace]) =>
    _showAppRouter ? _logger.e(data, error: error, stackTrace: stackTrace) : null;

// REST API logs
void logRestApi(dynamic data) => _showRestApi ? _logger.i(data) : null;
void logErrorRestApi(dynamic data, [dynamic error, StackTrace? stackTrace]) =>
    _showRestApi ? _logger.e(data, error: error, stackTrace: stackTrace) : null;

// Change notifier logs
void logChangeNotifier(dynamic data) => _showChangeNotifier ? _logger.i(data) : null;
void logErrorChangeNotifier(dynamic data, [dynamic error, StackTrace? stackTrace]) =>
    _showChangeNotifier ? _logger.e(data, error: error, stackTrace: stackTrace) : null;

// Firebase logs
void logFirebase(dynamic data) => _showFirebase ? _logger.i(data) : null;
void logErrorFirebase(dynamic data, [dynamic error, StackTrace? stackTrace]) =>
    _showFirebase ? _logger.e(data, error: error, stackTrace: stackTrace) : null;

class ConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      log(line);
    }
  }
}
