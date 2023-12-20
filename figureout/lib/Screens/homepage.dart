import 'dart:developer';

import 'package:figureout/Screens/lineChart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _count1FieldController = TextEditingController();
  TextEditingController _count2FieldController = TextEditingController();
  List<double> numbersX = [];
  List<double> numbersY = [];
  int count1 = 0;
  int count2 = 0;
  double a00 = 0;
  double a11 = 0;

  finalCal(List<double> X, List<double> Y) {
    List<double> FEXY = multiplyLists(X, Y);
    double EXY = calculateSum(FEXY);
    List<double> FEX2 = multiplyLists(X, X);
    double EX2 = calculateSum(FEX2);
    double EX = calculateSum(X);
    double EY = calculateSum(Y);

    double EXX2 = (EX * EX);
    double a1 = (count1 * EXY - EX * EY) / (count1 * EX2 - EXX2);
    double a0 = (EY / count1) - (a1 * EX / count1);

    setState(() {
      a00 = a0;
      a11 = a1;
    });
    log("$a00 $a11");
  }

  double calculateSum(List<double> numbersAsString) {
    double sum = 0;

    for (double number in numbersAsString) {
      // Use try-catch to handle cases where the string cannot be parsed as a double
      try {
        sum += number;
      } catch (e) {
        print("Error parsing number: $number");
      }
    }

    return sum;
  }

  List<double> multiplyLists(List<double> listA, List<double> listB) {
    List<double> result = [];

    // Check if both lists have the same length
    if (listA.length != listB.length) {
      print("Error: Lists must have the same length");
      return result;
    }

    for (int i = 0; i < listA.length; i++) {
      try {
        double numberA = listA[i];
        double numberB = listB[i];
        double product = numberA * numberB;
        result.add(product);
      } catch (e) {
        print("Error processing values at index $i");
        return result;
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Homepage"),
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => LineChartScreen()));
          //       },
          //       icon: Icon(Icons.map))
          // ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _count1FieldController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Enter comma-separated values'),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Split the entered text by commas and add to the list
                    List<String> enteredValues =
                        _count1FieldController.text.split(',');
                    for (String value in enteredValues) {
                      double? enteredNumber = double.tryParse(value.trim());
                      count1++;
                      if (enteredNumber != null) {
                        numbersX.add(enteredNumber);
                      } else {
                        // Show an error or handle invalid input
                        print(
                            'Invalid input: $value. Please enter valid numbers separated by commas.');
                      }
                    }
                    // _count1FieldController.clear();
                  });
                },
                child: Text('Add Numbers 1'),
              ),
              SizedBox(),

              // Text('Entered Numbers:'),
              // Column(
              //   children: numbers.map((number) {
              //     return Text('$number');
              //   }).toList(),
              // ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _count2FieldController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Enter comma-separated values'),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Split the entered text by commas and add to the list
                    List<String> enteredValues =
                        _count2FieldController.text.split(',');
                    for (String value in enteredValues) {
                      double? enteredNumber = double.tryParse(value.trim());
                      count2++;

                      if (enteredNumber != null) {
                        numbersY.add(enteredNumber);
                      } else {
                        // Show an error or handle invalid input
                        print(
                            'Invalid input: $value. Please enter valid numbers separated by commas.');
                      }
                    }
                    // _count2FieldController.clear();
                  });
                },
                child: Text('Add Numbers 2'),
              ),
              SizedBox(),
              CupertinoButton(
                  child: Text("Calculate"),
                  onPressed: () {
                    if (count1 == count2 && count1 != 0 && count2 != 0) {
                      finalCal(numbersX, numbersY);
                    }
                    print(" ${count1} ${count2}");
                    setState(() {
                      count1 = 0;
                      count2 = 0;
                    });
                  }),

              Column(
                children: [Text("a0 = $a00"), Text("a1 = $a11")],
              )
            ],
          ),
        ));
  }
}
