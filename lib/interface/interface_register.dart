import 'package:flutter/material.dart';

abstract class RegisterView {
  void showLoading();
  void hideLoading();
  void clearError();
  void showRegisterError(String error);
}

// Contract cho Presenter
abstract class RegisterPresenter {
  void register(BuildContext context, String fullName, String username,
      String password, String rePassword);
  void attachView(RegisterView view);
  void detachView();
}
