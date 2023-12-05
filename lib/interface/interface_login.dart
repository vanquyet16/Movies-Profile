abstract class LoginView {
  void showLoading();
  void hideLoading();
  void showLoginSuccess();
  void clearError();  
  void showLoginError(String error);
}

// Contract cho Presenter
abstract class LoginPresenter {
  void login(String username, String password);
  void attachView(LoginView view);
  void detachView();
}