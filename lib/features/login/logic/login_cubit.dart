import 'package:bloc/bloc.dart';
import 'package:docdoc/core/networking/dio_factory.dart';
import 'package:docdoc/features/login/data/models/login_request_body.dart';
import 'package:docdoc/features/login/data/models/login_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

import '../../../core/helpers/constants.dart';
import '../../../core/helpers/shared_pref.dart';
import '../data/repos/login_repo.dart';
import 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  void emitLoginState() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.Login(
        LoginRequestBody(
          email: emailController.text,
          password: passwordController.text,
        ));
    response.when(success: (loginResponse) async {
      emit(LoginState.success(loginResponse));
      await saveUserToken(loginResponse.userData!.token!);
    }, failure: (error) {
      emit(LoginState.failure(message: error.apiErrorModel.message ?? ''));
    });
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}