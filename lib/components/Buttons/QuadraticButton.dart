import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuadraticButton extends StatefulWidget {

  final Icon icon;
  final Function onPressed;

  QuadraticButton(this.icon, this.onPressed);

  @override
  _QuadraticButtonState createState() => _QuadraticButtonState(this.icon, this.onPressed);
}

class _QuadraticButtonState extends State<QuadraticButton> {

  final Icon icon;
  final Function onPressed;

  _QuadraticButtonState(this.icon, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: Material(
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: this.onPressed,
          child: new Container(
            child: this.icon,
            width: 60.0,
            height: 60.0,
          ),
        ),
        color: Colors.transparent,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.indigo,
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 15.0,
            offset: Offset(0, 5),
          ),
        ],
      ),
    );
  }
}
