import 'package:flutter/material.dart';
import 'package:checky/io/constant/constants.dart';
import 'add_button.dart';

class AddTaskInput extends StatefulWidget {
  @override
  _AddTaskInputState createState() => _AddTaskInputState();
}

class _AddTaskInputState extends State<AddTaskInput> {
  final TextEditingController inputController = TextEditingController();
  bool isInputValid = false;

  @override
  void initState() {
    super.initState();
    inputController.addListener(() {
      // confirm input is valid
      isInputValid = inputController.text.trim().isNotEmpty;
      // reset widget
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    inputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            kAddTaskText,
            textAlign: TextAlign.center,
            style: kAddTaskStyle,
          ),
          SizedBox(
            height: 30.0,
          ),
          TextField(
            autofocus: true,
            controller: inputController,
            textAlign: TextAlign.center,
            minLines: 1,
            autocorrect: false,
            decoration: kAddTaskInputDecoration,
          ),
          SizedBox(
            height: 20.0,
          ),
          Flexible(
            child: AddTaskButton(
              enable: isInputValid,
              inputText: inputController.text,
            ),
          ),
        ],
      ),
    );
  }
}
