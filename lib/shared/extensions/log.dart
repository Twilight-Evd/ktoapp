import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../core/utils/log.dart';

extension LogExtension on BuildContext {
  Logger get log => logger;
}
