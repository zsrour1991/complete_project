import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_project/features/login/data/models/login_request_body.dart';
import 'package:flutter_complete_project/features/login/data/repos/login_repo.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginrepo;
  LoginCubit(this._loginrepo) : super(const LoginState.initial());


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response= await _loginrepo.login(loginRequestBody);
    response.when(
        success: (loginResponse){
          emit(LoginState.success(loginResponse));
        },
        failure: (error){
          emit(LoginState.error(error: error.apiErrorModel.message?? ''));
        });
  }
}
