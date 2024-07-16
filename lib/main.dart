import 'package:docdoc/core/routing/app_routar.dart';
import 'package:flutter/material.dart';

import 'core/di/dependency_injection.dart';
import 'doc_app.dart';

void main() {
  setupGetIt();
  runApp( DocApp(approuter: AppRouter(),));
}

