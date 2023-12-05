import 'package:flutter/material.dart';
import 'package:movies_profile/component/component_textfield.dart';
import 'package:movies_profile/component/component_dialog.dart';
import 'package:movies_profile/interface/interface_login.dart';
import 'package:movies_profile/interface/interface_register.dart';
import 'package:movies_profile/views/screen/view_screen_login.dart';

import '../../presenters/presenters_login.dart';
import '../../presenters/presenters_register.dart';

class Register extends StatelessWidget {
  const Register({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            SizedBox(height: 10),
            Body(),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Image(
          image: AssetImage('resources/header_img.png'),
        ),
        Positioned(
          top: 65,
          left: 10,
          child: Text(
            "Xin Chào \nMời Đăng Ký",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> implements RegisterView {
  RegisterPresenterImpl presenter = RegisterPresenterImpl();
  late String errorMessage = "";

  @override
  void initState() {
    super.initState();
    presenter.attachView(this);
  }

  @override
  void dispose() {
    presenter.detachView();
    super.dispose();
  }

  // Hàm xử lý sự kiện đăng nhập
  void onRegisterButtonPressed(
      String fullName, String username, String password, String rePassword) {
    presenter.register(context, fullName, username, password, rePassword);
  }

  @override
  Widget build(BuildContext context) {
    final edUserNameController = TextEditingController();
    final edPassController = TextEditingController();
    final edFullNameController = TextEditingController();
    final edRePassController = TextEditingController();
    print(errorMessage);
    return Column(
      children: [
        const Align(
          alignment: Alignment(-0.88, -0.1),
          child: Text(
            "Họ Tên",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        CustomTextField(
          controller: edFullNameController,
          hintText: "Nhập Họ Tên",
          prefixIcon: Icons.person,
        ),
        const Align(
          alignment: Alignment(-0.88, -0.1),
          child: Text(
            "Tài Khoản",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        CustomTextField(
          controller: edUserNameController,
          hintText: "Nhập Tài Khoản",
          prefixIcon: Icons.person,
        ),
        const Align(
          alignment: Alignment(-0.88, -0.1),
          child: Text(
            "Mật Khẩu",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        CustomTextField(
          controller: edPassController,
          hintText: "Nhâp Mật Khẩu",
          prefixIcon: Icons.lock,
        ),
        const Align(
          alignment: Alignment(-0.77, -0.1),
          child: Text(
            "Nhập Lại Mật Khẩu",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        CustomTextField(
          controller: edRePassController,
          hintText: "Nhâp Lại Mật Khẩu",
          prefixIcon: Icons.lock,
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.center, // Dịch chuyển vị trí theo chiều dọc
          child: errorMessage.isNotEmpty
              ? Text(
                  errorMessage,
                  style: const TextStyle(
                      color: Colors.red, fontSize: 12, height: -0.5),
                )
              : const SizedBox(),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            String fullName = edRePassController.text;
            String userName = edUserNameController.text;
            String password = edPassController.text;
            String rePassword = edRePassController.text;
            onRegisterButtonPressed(fullName, userName, password, rePassword);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF19AFDF),
              padding: const EdgeInsets.fromLTRB(80, 12, 80, 12)),
          child: const Text("Đăng Ký"),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context)
                    .style, // Các cài đặt phông chữ mặc định
                children: const <TextSpan>[
                  TextSpan(
                    text: "Quay Lại Đăng Nhập!",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.grey // Thêm gạch dưới
                        ),
                  ),
                ],
              ),
            ))
      ],
    );
  }

  @override
  void clearError() {
    errorMessage = "";
    // TODO: implement clearError
  }

  @override
  void hideLoading() {
    // TODO: implement hideLoading
  }

  @override
  void showLoading() {
    // TODO: implement showLoading
  }

  @override
  void showRegisterError(String error) {
    setState(() {
      errorMessage = error;
    });
    // TODO: implement showRegisterError
  }

  @override
  void showDiaLog(context) {
    //  DialogHelper.showSampleDialog(context);
  }
}
