class ToDoClassModel {
  String title;
  String details;
  bool iSDone;

  ToDoClassModel(
      {required this.title, required this.details, required this.iSDone});

  toggleToDo() {
    iSDone = !iSDone;
  }
}
