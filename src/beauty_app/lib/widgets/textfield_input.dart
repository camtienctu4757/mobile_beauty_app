import 'package:flutter/material.dart';


class Input extends StatefulWidget {
  const Input({
    super.key,
    required this.placeholder,
    required this.getValue,
  });
  final String placeholder;
  final void Function(String, String) getValue;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool _isObscured = true;

  String? validData(value) {
    if (value.toString().isEmpty || value.toString().trim().length == 0) {
      return 'Vui lòng nhập';
    }
    if (widget.placeholder == 'User name') {
      if (value.toString().length > 10) {
        return 'Vui lòng nhập tên nhỏ hơn 10 ký tự!';
      }
    }
    if (widget.placeholder == 'Email') {
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegex.hasMatch(value)) {
        return 'Nhập sai định dạng emai vui lòng nhập lại';
      }
    }
    if (widget.placeholder == 'Password' ||
        widget.placeholder == 'Password again') {
      if (value.toString().length < 8) {
        return 'Vui lòng nhật mật khẩu dài hơn 8 ký tự';
      }
    }
  }


  @override
  Widget build(context) {
    void _toggleObscureText() {
      setState(() {
        _isObscured = !_isObscured;
      });
    }

    return TextFormField(
        decoration: InputDecoration(
            label: Text(widget.placeholder),
            fillColor: Theme.of(context).colorScheme.tertiary,
            filled: true,
            suffixIcon: widget.placeholder == 'Password' ||
                    widget.placeholder == 'Password again'
                  ?IconButton(
                    onPressed: _toggleObscureText,
                    icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off,
                    ))
                    :Container(
                    width: 0,
                    height: 0,
                  )
                    ,
            contentPadding: const EdgeInsets.all(10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none),
            labelStyle:
                TextStyle(color: Theme.of(context).colorScheme.secondary)),
        // validator:,
        onSaved: (value) {
          widget.getValue(widget.placeholder, value.toString());
        },
        validator: (value) {
          return validData(value);
        },
        obscureText: (widget.placeholder == 'User name' ||
                    widget.placeholder == 'Email')?false:_isObscured);
  }
}
