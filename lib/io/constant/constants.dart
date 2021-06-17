import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kAppName = 'Checky';

const kAddTaskText = 'Add Task';

const kAddButtonText = 'ADD';

const kAppNameStyle = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: 50.0,
  fontWeight: FontWeight.w700,
  letterSpacing: 1.5,
);

const kTextStyleWhite = TextStyle(
  color: Color(0xFFFFFFFF),
);

const kAddButtonStyle = TextStyle(
  color: Colors.white,
  decorationStyle: TextDecorationStyle.solid,
  fontSize: 20.0,
  fontWeight: FontWeight.w700,
);

const kAddTaskStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontSize: 25.0,
  fontWeight: FontWeight.w700,
);

const kAddTaskInputDecoration = InputDecoration(
  hintText: 'Enter value',
  disabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 0.5),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 3.0),
  ),
);

const kDeleteButtonStyle = TextStyle(
  color: Colors.white,
  fontSize: 17.0,
  fontWeight: FontWeight.w700,
);

const kDateStringStyle = TextStyle(
  fontSize: 10.0,
  fontWeight: FontWeight.w200,
);
