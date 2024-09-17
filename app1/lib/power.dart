import 'dart:math';

import 'package:flutter/material.dart';
import 'package:app1/main.dart';
import 'package:flutter/services.dart';

class MyPower extends StatefulWidget {
  const MyPower({super.key});

  @override
  State<MyPower> createState() => _MySquareState();
}

class _MySquareState extends State<MyPower> {
  final textController1 = TextEditingController();
  final textController2 = TextEditingController();

  double _exponent = 0.0;
  double _base = 0.0;
  double _result = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //appBar: AppBar(
        // title: const Center(
        //   child: Text("FERUZI"),
        // ),
        //  backgroundColor: Color.fromARGB(255, 77, 225, 84),
        // ),
        body: SafeArea(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(2),
              color: Colors.brown,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Text("Get the power of a number !",
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                  ),
                  Padding(
                    //displaying the answer after calculating the power of a number
                    padding: const EdgeInsets.fromLTRB(10, 20, 0, 40),
                    child: Text("$_result",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 35)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40.0,
                          width: 60.0,
                          child: TextField(
                              // the text field that receives only the base number
                              controller: textController1,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: const TextStyle(fontSize: 16),
                              decoration: const InputDecoration(
                                filled: true,
                                hintText: "b...",
                                border: OutlineInputBorder(),
                              )),
                        ),
                        const Text("   "),
                        SizedBox(
                          height: 40.0,
                          width: 60.0,
                          child: TextField(
                              // the text field that receives only the exponent number
                              controller: textController2,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: const TextStyle(fontSize: 16),
                              decoration: const InputDecoration(
                                filled: true,
                                hintText: "e...",
                                border: OutlineInputBorder(),
                              )),
                        ),
                        IconButton(
                            //an icon that clear both text fields and the answer
                            style: IconButton.styleFrom(
                                foregroundColor: Colors.black,
                                padding:
                                    const EdgeInsets.fromLTRB(80, 0, 0, 0)),
                            onPressed: () {
                              setState(() {
                                textController1.clear();
                                textController2.clear();
                                _result = 0;
                              });
                            },
                            icon: const Icon(Icons.delete)),
                      ],
                    ),
                  ),
                  Builder(builder: (context) {
                    return ElevatedButton(
                        //the button that process inputs and get the power result
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.all(16),
                          fixedSize: const Size.fromWidth(250),
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _base = double.parse(textController1.text);
                            _exponent = double.parse(textController2.text);
                            _result = pow(_base, _exponent).toDouble();
                          });
                        },
                        child: const Text("Process"));
                  }),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Builder(builder: (context) {
                      return ElevatedButton(
                          //the button that return to the home page
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.all(16),
                            fixedSize: const Size.fromWidth(250),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyWidget()),
                            );
                          },
                          child: const Text("Back"));
                    }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
