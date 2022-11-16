import 'package:flutter/material.dart';
import 'package:to_do_app/models/toDoClassModel.dart';
import 'package:to_do_app/pages/toDo/addToDoPage.dart';

class ToDoPage extends StatefulWidget {
  static List<ToDoClassModel> tasks = [
    ToDoClassModel(
        title: 'ToDo APP UI',
        details: 'Finch the UI  of To DO APP',
        iSDone: true),
    ToDoClassModel(
        title: 'ToDo APP Logic',
        details: 'Finch the Logic  of To DO APP',
        iSDone: true),
    ToDoClassModel(
        title: 'ToDo APP DataBase',
        details: 'Finch the local DataBase  of To DO APP',
        iSDone: false),
  ];
  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
//******* Start To Do Logic *********

  // return all tasks
  List<ToDoClassModel> getAllToDo() {
    return ToDoPage.tasks;
  }

  // return completed Tasks
  List<ToDoClassModel> getCompletedToDo() {
    return ToDoPage.tasks.where((todo) {
      return todo.iSDone;
    }).toList();
  }

  // return Incompleted Tasks
  List<ToDoClassModel> getInCompletedToDo() {
    return ToDoPage.tasks.where((todo) {
      return !todo.iSDone;
    }).toList();
  }

  // add To Do
  void addToDo(ToDoClassModel todo) {
    setState(() {
      ToDoPage.tasks.add(todo);
    });
  }

  // deleteToDo
  void deleteToDo(ToDoClassModel todo) {
    // get index from _tasks firstly
    setState(() {
      ToDoPage.tasks.remove(todo);
    });
  }

  //toggle To Do
  void toggleToDo(ToDoClassModel todo) {
    setState(() {
      final toDoIndex = ToDoPage.tasks.indexOf(todo);
      ToDoPage.tasks[toDoIndex].toggleToDo();
    });
  }

  // function to update all tasks list
  void updateAllToDoList(ToDoClassModel toDo) {
    setState(() {
      ToDoPage.tasks.add(toDo);
    });
  }

  // image assets
  Image emptyToDo = Image.asset('assets/images/emptyToDo.png');

  // showDialog
  void creatToDoWidget(context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Column(
            children: [
              Text(
                'Add To Do',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.amber[900]),
              ),
              Divider(
                color: Colors.amber[900],
              )
            ],
          ),
          backgroundColor: Colors.teal[100],
          elevation: 30,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Colors.amber, width: 2),
          ),
          children: [
            AddToDoPage(),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            elevation: 25,
            onPressed: () {
              creatToDoWidget(context);
            },
            child: Icon(
              Icons.add,
              color: Colors.amber,
            ),
            backgroundColor: Colors.teal,
          ),
          body: Column(
            children: [
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.teal[100],
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black38,
                  tabs: const [
                    Tab(
                      text: 'All',
                    ),
                    Tab(
                      text: 'Complete',
                    ),
                    Tab(
                      text: 'Incomplete',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Center(
                      child: (ToDoPage.tasks.isEmpty) ? emptyToDo : allToDo(),
                    ),
                    Center(
                      child:
                          (ToDoPage.tasks.isEmpty) ? emptyToDo : completeToDo(),
                    ),
                    Center(
                      child: (ToDoPage.tasks.isEmpty)
                          ? emptyToDo
                          : inCompleteToDo(),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

// To Do List View which contains lots of toDoListItems
  Widget toDoLsitView(List<ToDoClassModel> toDoList) {
    return ListView(
        children: toDoList.map((toDo) {
      return toDoListIem(toDo);
    }).toList());
  }

// To Do List Item Which Contains the to do data( title,details,isDone)
  Widget toDoListIem(ToDoClassModel toDo) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Checkbox(
            value: toDo.iSDone,
            onChanged: (val) {
              toggleToDo(toDo);
            },
          ),
          title: Text(
            toDo.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            toDo.details,
            style: TextStyle(fontSize: 15),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              deleteToDo(toDo);
            },
          ),
        ),
        Divider(
          color: Colors.teal,
        )
      ],
    );
  }

  // All To Do for  (allToDo Tab)
  Widget allToDo() {
    return toDoLsitView(getAllToDo());
  }

  // Complete To Do for  (completeToDo Tab)
  Widget completeToDo() {
    return toDoLsitView(getCompletedToDo());
  }

  // InComplete To Do for  (incompleteToDo Tab)
  Widget inCompleteToDo() {
    return toDoLsitView(getInCompletedToDo());
  }
}
