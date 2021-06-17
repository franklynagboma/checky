import 'package:checky/screens/tasks/model/task.dart';
import 'package:flutter/material.dart';
import 'package:checky/io/constant/constants.dart';
import 'package:provider/provider.dart';
import 'package:checky/screens/tasks/view_model/task_notifier.dart';

final List<String> weeklyString = [
  'MON',
  'TUE',
  'WED',
  'THUR',
  'FRI',
];
final List<String> monthString = [
  'JAN',
  'FEB',
  'MAR',
  'APR',
  'MAY',
  'JUN',
  'JUL',
  'AUG',
  'SEP',
  'OCT',
  'NOV',
  'DEC',
];

class AddTaskButton extends StatelessWidget {
  final bool enable;
  final String inputText;

  String currentDate() {
    String period = 'am';
    if (DateTime.now().hour >= 12 && DateTime.now().hour <= 24) period = 'pm';

    return '${DateTime.now().hour}:${DateTime.now().minute}$period, '
        '${weeklyString[DateTime.now().weekday - 1]}, ${DateTime.now().day}'
        ' ${monthString[DateTime.now().month - 1]}, ${DateTime.now().year}';
  }

  AddTaskButton({
    this.enable = false,
    @required this.inputText,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: enable
          ? () {
              Provider.of<TaskNotifier>(context).addNewTask(Task(
                title: inputText,
                date: currentDate(),
              ));
              Navigator.pop(context);
            }
          : null,
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      elevation: 5.0,
      color: Colors.lightBlueAccent,
      disabledElevation: 2.0,
      disabledColor: Colors.lightBlueAccent.shade100,
      child: Text(
        kAddButtonText,
        style: kAddButtonStyle,
      ),
    );
  }
}
