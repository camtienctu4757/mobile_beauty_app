import 'package:beauty_app/main.dart';
import 'package:beauty_app/screens/login.dart';
import 'package:beauty_app/widgets/textfield_input.dart';
import 'package:flutter/material.dart';
import 'package:beauty_app/assets/style/text_style.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  var _valueRegister = {};

  void getValue(String key, String value) {
    setState(() {
      _valueRegister[key] = value;
    });
  }

  void _Oth2Email() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_valueRegister['Password'] != _valueRegister['Password again']) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Nhập lại mật khẩu chưa đúng'),
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        List<int> password = utf8.encode(_valueRegister['Password']);
        String pwdCrypto = sha256.convert(password).toString();
        _valueRegister['Password'] = pwdCrypto;
        _valueRegister['Password again'] = pwdCrypto;
        _formKey.currentState!.reset();
        final url = Uri.http('127.0.0.1', '/signin');
        http.post(url, body: json.encode({..._valueRegister}));
        FocusScope.of(context).unfocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Nền hình ảnh
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/background/bg_signin.png',
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
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                        child: Text('ĐĂNG KÝ',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              // color: Theme.of(context).colorScheme.primary),
                            )),
                      ),
                      const SizedBox(height: 30.0),
                      Input(
                        placeholder: 'User name',
                        getValue: getValue,
                      ),
                      const SizedBox(height: 15),
                      Input(
                        placeholder: 'Email',
                        getValue: getValue,
                      ),
                      const SizedBox(height: 15),
                      Input(
                        placeholder: 'Password',
                        getValue: getValue,
                      ),
                      const SizedBox(height: 15),
                      Input(
                        placeholder: 'Password again',
                        getValue: getValue,
                      ),
                      const SizedBox(height: 22),
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
                            onPressed: _Oth2Email,
                            child: Text('GỬI',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Bạn đã có tài khoản?',
                              style: TextStyles.normalText),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                );
                              },
                              child: Text('Đăng nhập',
                                  style: TextStyles.normalText.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold)))
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
