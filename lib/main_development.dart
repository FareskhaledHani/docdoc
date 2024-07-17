import 'package:docdoc/core/routing/app_routar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_injection.dart';
import 'doc_app.dart';

void main() async{
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp( DocApp(approuter: AppRouter(),));
}

