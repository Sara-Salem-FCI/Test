import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mainn/modules/bmi_result/bmiResult.dart';

class bmiScreen extends StatefulWidget {
  const bmiScreen({Key? key}) : super(key: key);

  @override
  State<bmiScreen> createState() => _bmiScreenState();
}

class _bmiScreenState extends State<bmiScreen> {
  bool isMale = true;
  double height = 120;
  int weight = 40;
  int age = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'BMI Calucalator',
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10,),
                            color: isMale? Colors.green : Colors.grey[800],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image:
                              AssetImage('assets/images/fff-removebg-preview.png',),
                                width:90 ,
                                height: 90,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Male',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: GestureDetector( onTap: (){
                        setState(() {
                          isMale = false;
                        });
                      },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10,),
                            color: !isMale ? Colors.green : Colors.grey[800],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image:
                                  AssetImage('assets/images/ff-removebg-preview.png'),
                                width: 90,
                                height: 90,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Female',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10,),
                  color: Colors.grey[800],
                ),
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Height',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '${height.round()}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 70,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'CM',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Slider(
                          activeColor: Colors.green,
                          inactiveColor: Colors.white,
                            value: height,
                            max: 220,
                            min: 80,
                            onChanged: (value){
                            setState(() {
                              height = value;
                            });
                              print(value.round());
                            },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10,),
                          color: Colors.grey[800],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                'Age',
                  style: TextStyle(
                    color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                  ),
                ),
                            Text(
                              '$age',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 70,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                  mini: true,
                                  backgroundColor: Colors.green,
                                  child: Icon(Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                  backgroundColor: Colors.green,
                                  mini: true,
                                  child: Icon(Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10,),
                          color: Colors.grey[800],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Weight',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$weight',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 70,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                  backgroundColor: Colors.green,
                                  mini: true,
                                  child: Icon(Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                                FloatingActionButton(onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                  backgroundColor: Colors.green,
                                  mini: true,
                                  child: Icon(Icons.add,
                                    color: Colors.white,
                                  ),
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
            Container(
              width: double.infinity,
              color: Colors.green,
              child: MaterialButton(onPressed: (){
                double result = weight/pow(height/100, 2);
                print(result.round());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder:(context) => bmiResult(
                          isMale: isMale,
                          result: result.round(),
                          age: age,
                        ),
                    ),
                );
              },
                height: 50,
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
