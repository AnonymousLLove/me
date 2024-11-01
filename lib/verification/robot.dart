import 'package:flutter/material.dart';

class hello extends StatefulWidget {
  const hello({super.key});

  @override
  State<hello> createState() => _helloState();
}

class _helloState extends State<hello> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.blue),
            child: const Text('input name',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                )))
      ],
    ));
  }
}
