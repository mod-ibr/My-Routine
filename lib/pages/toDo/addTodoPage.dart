import 'package:flutter/material.dart';
import 'package:to_do_app/homePage.dart';
import 'package:to_do_app/models/toDoClassModel.dart';
import 'package:to_do_app/pages/toDo/toDoPage.dart';

class AddToDoPage extends StatefulWidget {
  const AddToDoPage({Key? key}) : super(key: key);

  @override
  State<AddToDoPage> createState() => _AddToDoPageState();
}

class _AddToDoPageState extends State<AddToDoPage> {
  final toDoTitleController = TextEditingController();
  final toDoDetailsController = TextEditingController();
  bool isDoneStatus = false;

  @override
  void dispose() {
    toDoTitleController.dispose();
    toDoDetailsController.dispose();
    super.dispose();
  }

  void onAdd() {
    final String textVal = toDoTitleController.text;
    final String toDoDetailsController = toDoTitleController.text;
    final bool isDone = isDoneStatus;
    if (textVal.isNotEmpty) {
      final ToDoClassModel todo = ToDoClassModel(
        title: textVal,
        details: toDoDetailsController,
        iSDone: isDone,
      );
      ToDoPage.tasks.add(todo);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      Navigator.pop(context);
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      height: MediaQuery.of(context).size.height / 2.4,
      child: Padding(
        padding: EdgeInsets.only(
          left: 8,
          right: 8,
        ),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  controller: toDoTitleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle:
                        TextStyle(color: Colors.amber[900], fontSize: 20),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.teal),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                TextField(
                  controller: toDoDetailsController,
                  decoration: InputDecoration(
                    labelText: 'Details',
                    labelStyle:
                        TextStyle(color: Colors.amber[900], fontSize: 20),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.teal),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                CheckboxListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.teal, width: 2),
                  ),
                  value: isDoneStatus,
                  onChanged: (checked) => setState(() {
                    isDoneStatus = checked!;
                  }),
                  title: Text('Completed'),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                ElevatedButton(
                  child: Text('Add'),
                  onPressed: onAdd,
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(10),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.teal[500]),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                            color: Colors.deepOrangeAccent, width: 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
