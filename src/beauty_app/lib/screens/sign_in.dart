// import 'package:beauty_app/widgets/textfield_input.dart';
import 'package:beauty_app/widgets/textfield_input.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  var _value = '';
  var _valueRegister = {};
  FocusNode _nameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  void getValue(String key, String value) {
    setState(() {
      _valueRegister[key] = value;
    });
  }

  void _validData() {
    _formKey.currentState!.validate();
  }

  void _Oth2Email() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_valueRegister['Password'] != _valueRegister['Password again']) {
        print(1);
      } else {
        // lam chuyen gi do de dang ky
        print(_valueRegister);
        FocusScope.of(context).unfocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Nền hình ảnh
          Image.asset(
            'lib/assets/images/background/bg_signin.png',
            fit: BoxFit.cover,
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
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 160, 15),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 55,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Input(
                        placeholder: 'User name',
                        getValue: getValue,
                      ),
                      const SizedBox(height: 15),
                      Input(placeholder: 'Email', getValue: getValue),
                      const SizedBox(height: 15),
                      Input(placeholder: 'Password', getValue: getValue),
                      const SizedBox(height: 15),
                      Input(placeholder: 'Password again', getValue: getValue),
                      const SizedBox(height: 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Cancle',
                                style: TextStyle(fontSize: 18),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: _Oth2Email,
                            child: Text('Sign up',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary),
                          )
                        ],
                      )
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
