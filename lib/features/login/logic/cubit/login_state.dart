
import 'package:flutter_complete_project/core/metworking/api_error_handler.dart';
import 'package:flutter_complete_project/core/metworking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';
@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loginLoading()= LoginLoading;
  const factory LoginState.loginSuccess(T data)=LoginSuccess<T>;
  const factory LoginState.loginError(ApiErrorModel apiErrorModel)=LoginError;
}
