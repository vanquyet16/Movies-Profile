import 'package:movies_profile/models/user.dart';

import '../interface/interface_login.dart';
import '../sevices/api/api_login_register.dart';

class LoginPresenterImpl implements LoginPresenter {
  LoginView? view; // Sử dụng kiểu dữ liệu cho phép giá trị null

  @override
  void attachView(LoginView view) {
    this.view = view;
  }

  @override
  void detachView() {
    view = null;
  }

  @override
  Future<void> login(String username, String password) async {
    User user = User(
      taiKhoan: username,
      matKhau: password,
      hoTen: null,
      ngaySinh: null,
      gioiTinh: null,
      moTa: null,
      hinhAnh: null,
      trangThai: null,
    );

    // Xóa thông báo lỗi khi bắt đầu nhập liệu mới
    view?.clearError();

    if (username.isEmpty) {
      view?.showLoginError('Vui lòng nhập tên người dùng');
      return;
    } else if (password.isEmpty) {
      view?.showLoginError('Vui lòng nhập mật khẩu');
      return;
    }
    try {
      Map<String, dynamic> pathData = await Api.submitData(user,AuthAction.login);
      if (pathData['message'] == 'dang nhap that bai') {
        view?.showLoginError('Thông Tin Tài Khoản Mật Khẩu Không Chính xác');
      } else {
        view?.showLoginSuccess();
      }
    } catch (error) {
      view?.showLoginError('Đã xảy ra lỗi: $error');
    }
  }
}
