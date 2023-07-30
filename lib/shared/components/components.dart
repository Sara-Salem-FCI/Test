import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final String text;
  final TextInputType type;
  bool password = false;
  Function(String)? onSubmit;
  Function(String)? onChange;
  final IconData preIcon;
  final IconData? sufIcon;
  final VoidCallback? sufPress;
  final TextEditingController controller;
  final Function? validator;
   TextForm({Key? key,
    required this.text,
    required this.type,
    required this.preIcon,
    required this.controller,
     required this.password,
      this.sufPress,
     this.sufIcon,
     this.onSubmit,
     this.onChange,
     this.validator,
    })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (String? value){
        return validator!(value);
      },
      controller: controller,
      keyboardType: type,
      obscureText: password,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      decoration: InputDecoration(
        border:
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),

        labelText: text,
        prefixIcon: Icon(preIcon,) ,
        suffixIcon: IconButton(onPressed: sufPress, icon: Icon(sufIcon,)),
      ),
    );
  }
}
class EnabelTextForm extends StatelessWidget {
  final String text;
  final TextInputType type;
  bool password = false;
  Function(String)? onSubmit;
  Function(String)? onChange;
  VoidCallback? onTap;
  final IconData preIcon;
  final IconData? sufIcon;
  final VoidCallback? sufPress;
  Color? PreIconColor;
  Color? LabelTextColor;
  Color? FocusBorderColor;
  Color BorderColor;
  Color? TextColor;
  Color? CursorColor;
  final TextEditingController controller;
  final Function? validator;
  EnabelTextForm({Key? key,
    required this.text,
    required this.type,
    required this.preIcon,
    required this.controller,
    required this.password,
    this.onTap,
    this.sufPress,
    this.sufIcon,
    this.onSubmit,
    this.onChange,
    this.PreIconColor,
    this.FocusBorderColor,
    this.LabelTextColor,
    required this.BorderColor,
    this.CursorColor,
    this.TextColor,
    this.validator,
  })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (String? value){
        return validator!(value);
      },
      controller: controller,
      cursorColor: CursorColor,
      keyboardType: type,
      obscureText: password,
      style: TextStyle(
        color: TextColor,
      ),
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      decoration: InputDecoration(
        enabledBorder:
        OutlineInputBorder(
          borderSide: BorderSide(color: BorderColor,),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FocusBorderColor!,
          ),
        ),
        labelText: text, labelStyle: TextStyle(color: LabelTextColor,),
        prefixIcon: Icon(preIcon, color: PreIconColor,) ,
        suffixIcon: IconButton(onPressed: sufPress, icon: Icon(sufIcon,)),
      ),
    );
  }
}
class DefultButton extends StatelessWidget {
  final String text;
  Color color = Colors.blue;
  final VoidCallback onpress;
  bool upper = true;
   DefultButton({Key? key,
    required this.text,
    required this.onpress})
       : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius:BorderRadius.circular(10,),
      ),
      width: double.infinity,
      child: MaterialButton(
        onPressed: onpress,
        child: Text(
          upper? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
Widget Task (Map model) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.green[200],
            radius: 40,
            child: Text(
              '${model['time']}',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${model['title']}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${model['date']}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
