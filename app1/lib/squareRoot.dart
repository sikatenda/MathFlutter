import 'dart:math';

import 'package:flutter/material.dart';
import 'package:app1/main.dart';
import 'package:flutter/services.dart';

class MySquare extends StatefulWidget {
  const MySquare({super.key});

  @override
  State<MySquare> createState() => _MySquareState();
}

class _MySquareState extends State<MySquare> {
  final textController1 = TextEditingController();

  double result = 0.0;
  double sqr = 0.0;

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
                    child: Text("Get a square root !",
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                  SizedBox(
                    child: Padding(
                      //displaying the answer after calculating the square root of a number
                      padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
                      child: Text("$result",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 35)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40.0,
                          width: 60.0,
                          child: TextField(
                              // the text field that receives only the number
                              controller: textController1,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: const TextStyle(fontSize: 16),
                              decoration: const InputDecoration(
                                filled: true,
                                hintText: "00.0",
                                border: OutlineInputBorder(),
                              )),
                        ),
                        IconButton(
                            //an icon that clear both text fields and the answer
                            style: IconButton.styleFrom(
                                foregroundColor: Colors.black,
                                padding:
                                    const EdgeInsets.fromLTRB(100, 0, 0, 0)),
                            onPressed: () {
                              setState(() {
                                textController1.clear();
                                result = 0;
                              });
                            },
                            icon: const Icon(Icons.delete)),
                      ],
                    ),
                  ),
                  Builder(builder: (context) {
                    return ElevatedButton(
                        //the button that process inputs and get the square root result
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.all(16),
                          fixedSize: const Size.fromWidth(250),
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            sqr = double.parse(textController1.text);
                            result = sqrt(sqr);
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
