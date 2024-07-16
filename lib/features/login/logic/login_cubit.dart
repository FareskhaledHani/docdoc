import 'package:bloc/bloc.dart';
import 'package:docdoc/features/login/data/models/login_request_body.dart';
import 'package:docdoc/features/login/data/models/login_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

import '../data/repos/login_repo.dart';
import 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();


   void emitLoginState(LoginRequestBody loginRequestBody)async{
     emit(const LoginState.loading());
     final response  =await _loginRepo.Login(loginRequestBody);
     response.when(success: (loginResponse){
       emit(LoginState.success(loginResponse));
     }, failure: (error){
       emit(LoginState.failure(message: error.apiErrorModel.message??''));
     });
   }


}
