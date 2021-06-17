import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:checky/screens/tasks/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:checky/screens/tasks/view_model/task_notifier.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:checky/io/constant/constants.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use Consumer to get Provider context
    return Consumer<TaskNotifier>(
      builder: (context, taskNotifier, child) => ListView.builder(
          itemCount: taskNotifier.taskLength,
          itemBuilder: (context, index) {
            final task = taskNotifier.tasksList[index];
            return TaskTile(
              title: task.title,
              currentDate: task.date,
              isChanged: task.isDone,
              checkboxCallback: (change) {
                taskNotifier.updateTaskCheckbox(position: index);
              },
              // Show Alert to notifier user before Delete
              deleteTaskCallback: () {
                try {
                  Alert(
                    context: context,
                    type: AlertType.warning,
                    title: 'Delete',
                    desc:
                        'You are about to delete ${task.title} from your $kAppName, '
                        'click Delete to delete or click Dismiss to cancel',
                    buttons: [
                      DialogButton(
                          child: Text(
                            'Okay',
                            style: kDeleteButtonStyle,
                          ),
                          onPressed: () {
                            taskNotifier.deleteTaskFromList(position: index);
                            Navigator.pop(context);
                          }),
                      DialogButton(
                          child: Text(
                            'Dismiss',
                            style: kDeleteButtonStyle,
                          ),
                          color: Colors.redAccent,
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ).show();
                } catch (e) {}
              },
            );
          }),
    );
  }
}
