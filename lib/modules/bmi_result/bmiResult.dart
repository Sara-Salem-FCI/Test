import 'package:flutter/material.dart';

class bmiResult extends StatelessWidget {
  final int result;
  final bool isMale;
  final int age;
  bmiResult({
    required this.result,
    required this.isMale,
    required this.age,
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: Text(
          'Your BMI',
          style: TextStyle(
            fontSize: 26,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon : Icon(
            Icons.keyboard_backspace,
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Gender: ${isMale? 'Male' : 'Female'}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 50,),
              Text(
                'Result: $result',
                style: TextStyle(
                  color: Colors.green[300],
                  fontWeight: FontWeight.bold,
                  fontSize: 70,
                ),
              ),
            SizedBox(height: 40,),

            Row(
              children: [
                Expanded(
                  child: LayoutBuilder(builder: (context, constraints) {
                    if(result < 18.5){ return Center(
                      child: Text('You are in the under weight range',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                        ),
                      ),
                    );}
                    else if(result>= 18.5 && result<=25){return Center(
                      child: Text('You are in the healthy weight range',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                        ),
                      ),
                    );}
                    else if(result> 25 && result<=29.9){return Center(
                      child: Text('you are in the overweight range',
                        style: TextStyle(
                        color: Colors.red,
                          fontSize: 20,
                      ),
                      ),
                    );}
                    else{return Center(
                      child: Text('you are in the obese range',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                    );}
                      }),
                ),
              ],
            ),

              SizedBox(height: 50,),
              Text(
                'Age: $age',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
