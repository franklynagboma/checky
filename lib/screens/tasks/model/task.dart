class Task {
  String title;
  bool isDone;
  String date;

  Task({this.title, this.date, this.isDone = false});

  void toggleIsDone() {
    isDone = !isDone;
  }
}
