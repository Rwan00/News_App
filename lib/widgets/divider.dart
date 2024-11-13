import 'dart:io';

import 'package:flutter/material.dart';

class MySeparetor extends StatelessWidget {
  const MySeparetor({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(119, 119, 119, 1),
            ),
          ),
          Expanded(
            child: Container(
              width: Platform.isWindows ? double.infinity : width * 0.6,
              height: 2.5,
              color: const Color.fromRGBO(119, 119, 119, 1),
            ),
          ),
        ],
      ),
    );
  }
}
