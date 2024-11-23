import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/constants.dart';
import 'package:flutter_complete_project/core/helpers/shared_pref_helper.dart';
import 'package:flutter_complete_project/core/metworking/dio_factory.dart';
import 'package:flutter_complete_project/features/login/data/models/login_request_body.dart';
import 'package:flutter_complete_project/features/login/data/repos/login_repo.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginrepo;
  LoginCubit(this.loginrepo) : super(const LoginState.initial());


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response= await loginrepo.login(loginRequestBody);
    response.when(
        success: (loginResponse)async{
         await saveToken(loginResponse.userData?.token??'');
          emit(LoginState.success(loginResponse));
        },
        failure: (error){
          emit(LoginState.error(error: error.apiErrorModel.message?? ''));
        });
   
  }
  saveToken(String token)async{
  await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
  DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
