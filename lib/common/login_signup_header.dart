// ignore: file_names
import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class genLoginSignupHeader extends StatelessWidget {
  String headerName;

  genLoginSignupHeader(this.headerName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50.0),
        Text(
          headerName,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 40,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
            shadows: [
              Shadow(
                color: Colors.grey.withOpacity(0.5),
                offset: const Offset(1, 2),
                blurRadius: 2,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Image.asset(
          "assets/images/logo_main.png",
          height: 150.0,
          width: 150.0,
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Text(
            'Taskify',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 40,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              shadows: [
                Shadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: const Offset(1, 2),
                  blurRadius: 2,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
