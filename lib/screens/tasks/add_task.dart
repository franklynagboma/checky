import 'package:flutter/material.dart';
import 'package:checky/screens/tasks/widgets/add_task_input.dart';

class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0XFF757575),
      child: Container(
        height: 250.0,
        padding: EdgeInsets.only(bottom: 30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18.0),
            topRight: Radius.circular(18.0),
          ),
        ),
        child: Center(
          child: AddTaskInput(),
        ),
      ),
    );
  }
}
