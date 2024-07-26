import 'package:docdoc/core/helpers/extentions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_injection.dart';
import 'core/helpers/constants.dart';
import 'core/helpers/shared_pref.dart';
import 'core/routing/app_routar.dart';
import 'doc_app.dart';
import 'firebase_options.dart';

bool isloggedInUser = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await checkedIfLoggedInUser();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(DocApp(approuter: AppRouter()));
}
checkedIfLoggedInUser()async{
  String ? userToken =await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if(!userToken.isNullOrEmpty()){
    isloggedInUser = true;
  }

}