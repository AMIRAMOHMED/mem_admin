import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mem_admain/core/sharedpre/shared_pref_key.dart';
import 'package:mem_admain/feature/login/data/models/login_request_body.dart';
import 'package:mem_admain/feature/login/data/models/set_firebase_it_request_body.dart';
import 'package:mem_admain/feature/login/data/repository/login_repo.dart';
import 'package:mem_admain/feature/login/logic/login_cubit/login_state.dart';

import '../../../../core/sharedpre/shared_pref.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void emitLoginState() async {
    emit(const LoginState.loading());
    final respons = await _loginRepo.login(
      LoginRequestBody(
          password: passwordController.text,
          emailOrUsername: emailController.text),
    );

    respons.when(success: (loginResponse) async {
      final loginResponseBody = loginResponse;
      {
        await SharedPref()
            .setString(PrefKeys.accessToken, loginResponseBody.token ?? '');
        await SharedPref().setString(PrefKeys.userId, loginResponseBody.id ?? '');
      }
      FirebaseMessaging.instance.getToken().then((String? tokenId) async {
          await _loginRepo.setFirebaseId(
            'Bearer ${loginResponseBody.token}',
            SetFireBaseIdBodyRequest(id: tokenId!)
          );
          
            debugPrint('Login Token ==> $loginResponseBody.token');
        });

      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
 
}
