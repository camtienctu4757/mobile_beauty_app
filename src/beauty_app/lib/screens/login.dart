import 'package:beauty_app/assets/style/text_style.dart';
import 'package:beauty_app/screens/sign_in.dart';
import 'package:beauty_app/widgets/textfield_input.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var _valueRegister = {};

  void getValue(String key, String value) {
    setState(() {
      _valueRegister[key] = value;
    });
  }

  String? validData(placeholder, value) {
    if (value.toString().isEmpty || value.toString().trim().length == 0) {
      return 'Vui lòng nhập';
    }
    if (placeholder == 'User name') {
      if (value.toString().length > 10) {
        return 'Vui lòng nhập tên nhỏ hơn 10 ký tự!';
      }
    }
    if (placeholder == 'Email') {
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegex.hasMatch(value)) {
        return 'Nhập sai định dạng emai vui lòng nhập lại';
      }
    }
    if (placeholder == 'Password' || placeholder == 'Password again') {
      if (value.toString().length < 8) {
        return 'Vui lòng nhật mật khẩu dài hơn 8 ký tự';
      }
    }
  }

  void _validData() {
    _formKey.currentState!.validate();
  }

  // void _Oth2Email() {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();
  //     if (_valueRegister['Password'] != _valueRegister['Password again']) {
  //       // focus lai password again
  //       //...
  //     } else {
  //       // lam chuyen gi do de dang ky
  //       print(_valueRegister);
  //       FocusScope.of(context).unfocus();
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Nền hình ảnh
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/background/bg_login.png',
              fit: BoxFit.cover,
            ),
          ),
          // Nội dung trang đăng nhập
          Container(
            color: const Color.fromARGB(255, 255, 255, 255)
                .withOpacity(0.1), // Mức độ mờ của nền hình ảnh
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 16),
              child: Form(
                onChanged: () {
                  setState(() {
                    _validData();
                  });
                },
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                        child: Text(
                          'ĐĂNG NHẬP',
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Input(
                        placeholder: 'User name',
                        getValue: getValue,
                      ),
                      const SizedBox(height: 15),
                      Input(
                        placeholder: 'Password',
                        getValue: getValue,
                      ),
                      const SizedBox(height: 37),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'HỦY',
                                style: TextStyle(fontSize: 18),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('ĐĂNG NHẬP',
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0), fontSize: 18)),
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Bạn đã chưa có tài khoản?',
                              style: TextStyles.normalText),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignInScreen()),
                                );
                              },
                              child: Text('Đăng ký',
                                  style: TextStyles.normalText.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary,
                                      fontWeight: FontWeight.bold),
                                          
                                      ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
