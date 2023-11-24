import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hint;
  final Function(String)? onChanged;
  final TextInputType? inputType;
  final TextEditingController? controller;

  const InputField(
      {required this.title,
      required this.hint,
      this.onChanged,
      this.inputType,
      this.controller,
      super.key}); 

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 6),
              width: double.infinity,
              height: height * 0.07,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blueGrey)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        controller: controller,
                        keyboardType: inputType,
                        onChanged: onChanged,
                        autofocus: false,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                        cursorColor: Colors.blueGrey,
                        decoration: InputDecoration(
                            hintText: hint,
                            hintStyle: const TextStyle(
                                fontSize: 20, color: Colors.grey),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0)),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}