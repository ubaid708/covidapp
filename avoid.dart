import 'package:flutter/material.dart';

class Avoid extends StatelessWidget {
  const Avoid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "HOW TO AVOID COVID 19",
          style: TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: const Column(
        children: [
          Text(
            "Wearing a mask and putting distance between yourself and others can help lower the risk of COVID-19 transmission. Testing for COVID-19 can help you decide what to do next, like getting treatment to reduce your risk of severe illness and taking steps to lower your chances of spreading COVID-19 to others..",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
