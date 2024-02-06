import 'package:beauty_app/widgets/textfield_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var isLogin = true;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
        // Nền hình ảnh
          Image.asset(
            'lib/assets/images/background/bg_login.png', // Đường dẫn tới hình ảnh của bạn
            fit: BoxFit.cover,
          ),
          // Nội dung trang đăng nhập
          Container(
            color: const Color.fromARGB(255, 255, 255, 255)
                .withOpacity(0.1), // Mức độ mờ của nền hình ảnh
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 80, 16, 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 16, 160, 0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onTertiary),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 26),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Chào mừng bạn quay trở lại!',
                          style: TextStyle(
                            color: Color.fromARGB(255, 113, 110, 100),
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SvgPicture.asset(
                            'lib/assets/images/icon/heart.svg', // Thay đổi đường dẫn tới ảnh SVG của bạn
                            width: 16.0, // Điều chỉnh kích thước của ảnh
                            height: 16.0),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  const Input(placeholder: 'Nhập Email'),
                  const SizedBox(height: 16.0),
                  const Input(placeholder: 'Nhập mật khẩu'),
                  const SizedBox(height: 25.0),
                  ElevatedButton(
                    onPressed: () {
                      // Xử lý đăng nhập
                    },
                    child: const Text(
                      'Đăng nhập',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 30)),
                  ),
                  const SizedBox(height: 8.0),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Cancle',
                        style: TextStyle(
                            color: Color.fromARGB(255, 165, 149, 127),
                            fontSize: 19),
                      ))
                ]
              ),
              ),
          ),
      ]),
    );
  
  }
}
