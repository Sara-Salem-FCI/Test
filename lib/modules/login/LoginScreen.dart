import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final pass = TextEditingController();
  bool isPass = true;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                 TextForm(text: 'Email', type: TextInputType.emailAddress,preIcon: Icons.email, password: false,
                   onChange: (value){print(value);},
                   controller: email,
                   validator: (value){ if(value!.isEmpty) {return 'Please write the Email';} return null;},),
                  SizedBox(
                    height: 20,
                  ),
                  TextForm(text: 'Password', type: TextInputType.visiblePassword, onChange: (value){print(value);},
                    preIcon: Icons.lock, password: isPass,
                    sufPress: (){
                    setState(() {
                      isPass=!isPass;
                    });
                    },
                    sufIcon: isPass? Icons.visibility : Icons.visibility_off, controller: pass,
                    validator: (value){ if(value!.isEmpty) {return 'Please write the Password';} return null;},),
                  SizedBox(
                    height: 20,
                  ),
                  DefultButton(text: 'login', onpress: (){
                    if(formKey.currentState!.validate()){
                      print(email.text);
                      print(pass.text);
                    }
                  },),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?'
                      ),
                      TextButton(onPressed: (){}, child: Text(
                        'Register Now',
                      ),)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
