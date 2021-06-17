import 'package:flutter/material.dart';
import 'package:checky/io/constant/constants.dart';

class TaskTile extends StatelessWidget {
  final bool isChanged;
  final String title;
  final String currentDate;
  final Function checkboxCallback;
  final Function deleteTaskCallback;
  TaskTile({
    this.title,
    this.currentDate,
    this.isChanged,
    @required this.checkboxCallback,
    this.deleteTaskCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            fontSize: 15.0,
            decoration: isChanged ? TextDecoration.lineThrough : null),
      ),
      subtitle: Text(
        currentDate != null ? currentDate : '',
        style: kDateStringStyle,
      ),
      trailing: Checkbox(
        activeColor: Colors.redAccent,
        value: isChanged,
        // Since it is a named function call back and
        // call back has one value with same data type
        // as argument, use direct name call
        onChanged: checkboxCallback,
      ),
      onLongPress: deleteTaskCallback,
    );
  }
}
