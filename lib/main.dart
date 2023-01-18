import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "あっち向いてホイ",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AttimuitehoiPage(),
    );
  }
}

class AttimuitehoiPage extends StatefulWidget {
  const AttimuitehoiPage({super.key});

  @override
  State<AttimuitehoiPage> createState() => _AttimuitehoiPageState();
}

class _AttimuitehoiPageState extends State<AttimuitehoiPage> {
  String myHand = "↑";
  String completerHand = "↑";
  String result = "";
  String kaihiPrint = "スタート";
  int kaihiCount = 0;

  void selectHand(String selectedHand) {
    myHand = selectedHand;
    print(myHand);
    generateCompleteHand();
    judge();
    kaihiCounter();
    kaihiPrinter();
    setState(() {});
  }

  void generateCompleteHand() {
    final randomNumber = Random().nextInt(4);
    completerHand = randomNumberToHand(randomNumber);
  }

  String randomNumberToHand(int randomNumber) {
    switch (randomNumber) {
      case 0:
        return '↑';
      case 1:
        return '↓';
      case 2:
        return '→';
      case 3:
        return '←';
      default:
        return '↑';
    }
  }

  void judge() {
    if (myHand == completerHand) {
      result = "回避失敗";
    } else {
      result = "回避成功";
    }
  }

  void kaihiCounter() {
    kaihiCount++;
    if (result == "回避失敗") {
      kaihiPrint = "スタート";
      kaihiCount = 0;
    }
  }

  void kaihiPrinter() {
    kaihiPrint = "回避成功回数$kaihiCount回";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("あっち向いてホイ"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              kaihiPrint,
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            Text(
              completerHand,
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            Text(
              myHand,
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectHand("↑");
                  },
                  child: const Text("↑"),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand("↓");
                  },
                  child: const Text("↓"),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand("→");
                  },
                  child: const Text("→"),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand("←");
                  },
                  child: const Text("←"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
