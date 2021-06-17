import 'package:flutter/material.dart';
import 'package:checky/io/constant/constants.dart';
import 'package:checky/screens/tasks/widgets/tasks_list.dart';
import 'package:checky/screens/tasks/add_task.dart';
import 'package:provider/provider.dart';
import 'package:checky/screens/tasks/view_model/task_notifier.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 100.0, bottom: 30.0, left: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlue,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  kAppName,
                  style: kAppNameStyle,
                ),
                Text(
                  Provider.of<TaskNotifier>(context).tasksLengthInfo,
                  style: kTextStyleWhite.copyWith(
                    letterSpacing: 1.5,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: TasksList(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // showBottomSheet vs showModalBottomSheet
          /// showBottomSheet is use for Persist bottom sheet,
          /// which allows the content of the foreground widget to
          /// bet accessible when showing and can only be functional
          /// when show on as the first child of a build context
          /// which must not be in a scaffold widget
          ///
          /// while showModalBottomSheet, does the opposite of
          /// showBottomSheet and not necessary must be in or out
          /// of a scaffold widget.
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTask(),
                  ));
        },
      ),
    );
  }
}
