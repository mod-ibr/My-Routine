import 'package:flutter/material.dart';
import 'package:to_do_app/consts/colors.dart';
import 'package:to_do_app/pages/notes/notesPage.dart';
import 'package:to_do_app/pages/toDo/toDoPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.wysiwyg),
        label: 'To Do',
        backgroundColor: toDoMainColor),
    BottomNavigationBarItem(
        icon: Icon(Icons.edit),
        label: 'Notes',
        backgroundColor: notesMainColor),
  ];

  List<Widget> pages = [
    ToDoPage(),
    NotesPage(),
  ];
  int selectedPage = 0;

  void changePage(chosenPage) {
    setState(() {
      selectedPage = chosenPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: Card(
            elevation: 15,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              side: BorderSide(color: Colors.amber, width: 2),
            ),
            margin: EdgeInsets.only(bottom: 30),
            color: (selectedPage == 0) ? toDoMainColor : notesMainColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'My Day',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(75),
        ),
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height * 0.087,
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Card(
            elevation: 20,
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
              side: BorderSide(color: Colors.amber, width: 2),
            ),
            child: BottomNavigationBar(
              items: bottomNavBarItems,
              currentIndex: selectedPage,
              onTap: changePage,
              type: BottomNavigationBarType.shifting,
              showUnselectedLabels: true,
              selectedItemColor: bottomNavBarSelectedItemColor,
              unselectedItemColor: Colors.amberAccent.withOpacity(0.7),
              selectedFontSize: 18,
              selectedIconTheme: IconThemeData(size: 20),
              unselectedIconTheme: IconThemeData(size: 15),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: pages[selectedPage],
        ),
      ),
    );
  }
}
