import 'package:flutter/material.dart';
import 'package:movies_profile/interface/interface_login.dart';
import 'package:movies_profile/public/Color/AppColor.dart';
import 'package:movies_profile/views/screen/view_screen_tab.dart';

import '../../component/component_textfield.dart';
import '../../presenters/presenters_login.dart';
import 'view_screen_register.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Header(),
            SizedBox(
              height: 60,
            ),
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
            "Xin Chào \nMời Đăng Nhập",
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

class _BodyState extends State<Body> implements LoginView {
  LoginPresenter presenter = LoginPresenterImpl();
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
  void onLoginButtonPressed(String username, String password) {
    presenter.login(username, password);
  }

  @override
  Widget build(BuildContext context) {
    final edUserController = TextEditingController();
    final edPassController = TextEditingController();
    print(errorMessage);
    return Column(
      children: [
        const Align(
          alignment: Alignment(-0.88, -0.2),
          child: Text(
            "Tài Khoản",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        CustomTextField(
          controller: edUserController,
          hintText: "Nhập Tài Khoản",
          prefixIcon: const Icon(
            Icons.person,
            color: Colors.black,
          ),
        ),
        const Align(
          alignment: Alignment(-0.88, -0.1),
          child: Text("Mật Khẩu",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        CustomTextField(
            controller: edPassController,
            hintText: "Nhâp Mật Khẩu",
            prefixIcon: const Icon(
              Icons.lock,
            )),
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
            String userName = edUserController.text;
            String password = edPassController.text;
            onLoginButtonPressed(userName, password);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF19AFDF),
              padding: const EdgeInsets.fromLTRB(80, 12, 80, 12)),
          child: const Text("Đăng Nhập"),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Register()),
              );
            },
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context)
                    .style, // Các cài đặt phông chữ mặc định
                children: const <TextSpan>[
                  TextSpan(
                    text: "Bạn Chưa có Tài Khoản? ",
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
  void hideLoading() {
    // TODO: implement hideLoading
  }

  @override
  void showLoading() {
    // TODO: implement showLoading
  }

  @override
  void showLoginError(String error) {
    setState(() {
      errorMessage = error;
    });
  }

  @override
  void showLoginSuccess() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              const TabScreen()), // Thay thế YourNextScreen với màn hình tiếp theo cần chuyển tới
    );
  }

  @override
  void clearError() {
    setState(() {
      errorMessage = "";
    });
  }
}
