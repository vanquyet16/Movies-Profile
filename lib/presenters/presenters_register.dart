import 'package:flutter/src/widgets/framework.dart';
import 'package:movies_profile/component/component_dialog.dart';
import 'package:movies_profile/models/user.dart';

import '../interface/interface_register.dart';
import '../sevices/api/api_login_register.dart';

class RegisterPresenterImpl implements RegisterPresenter {
  RegisterView? view;

  @override
  void attachView(RegisterView view) {
    this.view = view;
  }

  @override
  void detachView() {
    view = null;
  }

  @override
  Future<void> register(BuildContext context, String fullName, String username,
      String password, String rePassword) async {
    const String titleDialog = "Đăng Ký Thành Công";
    const String bodyDialog = "Bạn Có Muốn Đến Màn Hình Đăng Nhập";
    User user = User(
      taiKhoan: username,
      matKhau: password,
      hoTen: fullName,
      ngaySinh: null,
      gioiTinh: null,
      moTa: null,
      hinhAnh: null,
      trangThai: null,
    );
    if (fullName.isEmpty ||
        username.isEmpty ||
        password.isEmpty ||
        rePassword.isEmpty) {
      view?.showRegisterError("Vui Long Nhập đủ Thông tin");
      return;
    } else if (password != rePassword) {
      view?.showRegisterError("Nhập Lại Mật Khẩu Không Khớp");
      return;
    }
    Map<String, dynamic> pathData =
        await Api.submitData(user, AuthAction.register);
    if (pathData['message'] == "Tài khoản đã tồn tại") {
      view?.showRegisterError("Tài khoản đã tồn tại");
      return;
    } else {
      // ignore: use_build_context_synchronously
      DialogHelper.showSampleDialog(context, titleDialog, bodyDialog);
    }
  }
}
