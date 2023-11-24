import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hint;
  final Function(String)? onChanged;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final String? Function(String?) validator;
  final Widget? widget;

  const InputField(
      {required this.title,
      required this.hint,
      this.onChanged,
      this.inputType,
      this.controller,
        required this.validator,
        this.widget,
      super.key}); 

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          margin: const EdgeInsets.only(top: 6),
          width: double.infinity,
          height: height * 0.07,

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    validator: validator,
                    controller: controller,
                    keyboardType: inputType,
                    onChanged: onChanged,
                    autofocus: false,
                    style:
                        const TextStyle(fontSize: 20, color: Colors.black),
                    cursorColor: Colors.blueGrey,
                    decoration: InputDecoration(
                      suffixIcon: widget,
                        hintText: hint,
                        hintStyle: const TextStyle(
                            fontSize: 20, color: Colors.grey),

                    )
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}