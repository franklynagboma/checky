import 'package:flutter/material.dart';
import 'package:checky/screens/tasks/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:checky/screens/tasks/view_model/task_notifier.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskNotifier>(
      create: (context) => TaskNotifier(),
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: Colors.lightBlue,
            disabledColor: Colors.redAccent.shade100,
            primaryColorDark: Colors.lightBlue,
            iconTheme: IconThemeData().copyWith(
              size: 30.0,
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData().copyWith(
              backgroundColor: Colors.redAccent,
            )),
        home: TasksScreen(),
      ),
    );
  }
}
