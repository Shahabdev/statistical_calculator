


import 'package:calulator_assignment/components/Calcultion_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '../components/myButton.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   List<double> userInput=[] ;
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 8),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: userInput.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text(
                              "${userInput[index]}",
                              style:const TextStyle(color: Colors.white, fontSize:30,fontWeight: FontWeight.bold),
                            );  }, separatorBuilder: (BuildContext context, int index) {
                            return const Text(' , ',style: TextStyle(fontSize: 30,color: Colors.white),);
                        },

                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(answer.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child:Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MyButton(
                            name: 'AC',
                            onpress: () {
                              setState(() {
                                userInput.clear();
                                answer = '';
                              });
                            },
                          ),
                          MyButton(
                              name: 'DEL',
                              onpress: () {

                              setState(() {
                                userInput.remove(userInput.removeLast());

                              });

                              }),
                          MyButton(
                              name: '%',
                              onpress: () {
                                //userinput += '%';
                                setState(() {});
                              }),
                          MyButton(
                            name: 'Mean',
                            onpress: () {

                              double mean = CalculationFunction.calculateMean(userInput);
                              answer = "Mean: $mean";
                              //userinput += '/';
                              setState(() {});
                            },
                            buttonColor: Color(0xffffa00a),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                              name: '7',
                              onpress: () {
                                userInput.add(7.0);
                                setState(() {});
                              }),
                          MyButton(
                              name: '8',
                              onpress: () {
                                userInput.add(8.0);

                                setState(() {});
                              }),
                          MyButton(
                              name: '9',
                              onpress: () {
                                userInput.add(9.0);
                                setState(() {});
                              }),
                          MyButton(
                            name: 'freq',
                            onpress: () {
                              List<int> userInputAsInt = userInput.map((double value) => value.toInt()).toList();

                              Map<int, int> frequencyMap = CalculationFunction.calculateFrequency(userInputAsInt);
                              answer='Frequency :$frequencyMap';
                              setState(() {});
                            },
                            buttonColor: Color(0xffffa00a),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                              name: '4',
                              onpress: () {
                                userInput.add(4.0);
                                setState(() {});
                              }),
                          MyButton(
                              name: '5',
                              onpress: () {
                                userInput.add(5.0);
                                setState(() {});
                              }),
                          MyButton(
                              name: '6',
                              onpress: () {
                                userInput.add(6.0);
                                setState(() {});
                              }),
                          MyButton(
                            name: 'Mod',
                            onpress: () {
                              List<double> mode = CalculationFunction.calculateMode(userInput);
                              answer = "Mode: $mode";
                              //userinput += '-';
                              setState(() {});
                            },
                            buttonColor: Color(0xffffa00a),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                              name: '1',
                              onpress: () {
                                userInput.add(1.0);
                                setState(() {});
                              }),
                          MyButton(
                              name: '2',
                              onpress: () {
                                userInput.add(2.0);
                                setState(() {});
                              }),
                          MyButton(
                              name: '3',
                              onpress: () {
                                userInput.add(3.0);
                                setState(() {});
                              }),
                          MyButton(
                            name: 'σX',
                            onpress: () {
                              double standardDev=CalculationFunction.calculateStandardDeviation(userInput).roundToDouble();
                              answer="StandDev :$standardDev";
                              setState(() {});
                            },
                            buttonColor: Color(0xffffa00a),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                              name: '0',
                              onpress: () {
                                userInput.add(0.0);
                                setState(() {});
                              }),
                          MyButton(
                              name: '.',
                              onpress: () {
                                //userinput += '.';
                                setState(() {});
                              }),
                          MyButton(
                              name: 'DEL',
                              onpress: () {
                                //userinput +='mode';
                                setState(() {

                                });
                              }),
                          MyButton(
                            name: 'Md ~',
                            onpress: () {
                              double median = CalculationFunction.calculateMedian(userInput);
                              answer = "Median: $median";
                              setState(() {});
                            },
                            buttonColor: Color(0xffffa00a),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
