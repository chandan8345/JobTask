import 'package:flutter/material.dart';

class Components {

  Widget textField(controller,keyboardType) => TextFormField(
        keyboardType: keyboardType,
        controller: controller,
      );

  Widget fieldTitle(text) => Text(
        text,
        style: TextStyle(color: Colors.black54,fontSize: 11),
      );

  Widget appbarBtn(value) => Row(
        children: <Widget>[
          Text(
            'STEP',
            style: TextStyle(color: Colors.white60),
          ),
          SizedBox(
            width: 8,
          ),
          Container(
            width: 30,
            child: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(
                '$value',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      );
}
