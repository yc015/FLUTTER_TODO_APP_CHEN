// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo_app_chen/constants/colors.dart';
import 'package:todo_app_chen/model/todo.dart';
import 'package:todo_app_chen/widgets/todo_widgets.dart';

// A stateful Home Class for our todo app
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  // A StatuWidget class will also to dynamically change the state of widgets inside it 
  // Create the HomeState for the Home Widget
  @override
  State<Home> createState() => _HomeState();
}

// The _HomeState class for our Todo App
class _HomeState extends State<Home> {
  // Initialize a list of todo items from the todoList class method
  final todoList = ToDo.todoList();
  // Creates the controller for the adding new todo item text field
  final _todoController = TextEditingController();
  // List of todo objects
  // The list is used to keep track of the todo of which text matching with the search keyword
  List<ToDo> _foundToDo = [];

  // Initialize the State
  @override
  void initState() {
    // Assign todoList to the _foundToDo since no search word has been typed in
    // Show all todoList (if available) to the user
    _foundToDo = todoList;
    super.initState();
  }

  // Initialize the widgets inside the home app
  @override
  Widget build(BuildContext context) {
    // Use the scaffold layout for the content inside home app
    return Scaffold(
      // Use creamGreen as the background color for the screen
      backgroundColor: creamGreen,
      // Use AppBar to title our app
      appBar: AppBar(
        // Use greyGreen as the background color
        backgroundColor: greyGreen,
        // With this title 
        title: const Text("TODO APP: Add your actionable items!"),
        // Center the display of the title
        centerTitle: true,
      ),
      // Use Stack layout for the search bar, todo list, and add to do input box
      body: Stack(
        children: [
          // Container for the search bar and to List
          Container(
            // Pad the content symmetrically by 20 on the horizontal axis and 15 on the vertical axis
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            // Use Column layout for placing the search bar and list tiles
            child:Column(
              children: [
                // Initialize the search bar
                searchBar(),
                // Wrap the ListView with expanded
                Expanded(
                  // Use the ListView to organize the content of to do list
                  child: ListView(
                    children: [
                      // Wrap the title of the To Do List into a separate container
                      Container(
                        margin: EdgeInsets.only(top: 35, bottom: 20),
                        child: Text("All TODO items", style: TextStyle(fontSize: 30, color: Colors.green,),
                      ),),
                      // Iterate the items in _foundToDo (items matched with keywords in the search bar) with resersed order
                      // if not keyword is entered, _foundToDo will have all the added to do items
                      for (ToDo todo in _foundToDo.reversed)
                        ToDoItem(todo: todo, onToDoChanged: _handleToDoChange, onDeleteItem: _deleteToDoItem,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Wrap the Add to do item input box into a Alignment widget
          Align(
            // Align the input box at the bottom center of the app
            alignment: Alignment.bottomCenter,
            // Organize the widgets inside this alignment using Row layout (horizontal layout)
            child: Row(children: [
              // Wrap the input text box into a Expanded widget
              Expanded(
                // Use container to wrap the input text box
                child: Container(
                  // Pad content symmetrically by 20 on the horizontal axis and 10 on the vertical axis
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  // Set margin at bottom, left, and right to 20
                  margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  // Decorate the text box
                  decoration: BoxDecoration(
                    // Use white as background color
                    color: Colors.white,
                    // Drop a shadown behind the input text box
                    boxShadow: [BoxShadow(color: Colors.grey, 
                    // The shadow has no offset
                    offset: Offset(0, 0), 
                    // blur the shadow with radius of 12
                    blurRadius: 12,
                    // and further inflate the shadow by 3
                    spreadRadius: 3,
                    ),],
                    // Round the border with radius of 10
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    // Add controller to the text field
                    // so we can access the text inside the field and clear it after-the-fact
                    controller: _todoController,
                    // Decorate the input text box
                    decoration: InputDecoration(
                        // Text that will be displayed as hint when no input is entered
                        hintText: 'Add a new item!',
                        // Set input border to default
                        border: InputBorder.none),
                  ),
                )
              ),
              // Wrap the add to do button into a container
              Container(
                // Set margin at bottom and right to 20
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                // And use a elevated button as the add to do button
                child: ElevatedButton(
                  child: Text(
                    // Plus symbol for adding a to do
                    '+',
                    style: TextStyle(
                      // Enlarge the plus symbol
                      fontSize: 40,
                    ),
                  ),
                  // When this button is on pressed invoke the functin inside
                  onPressed: () {
                    // call _addToDoItem function which will create another to do item from the input text
                    // and clear the text field in the input box once it finishes
                    _addToDoItem(_todoController.text);
                  },
                  // Style the button
                  style: ElevatedButton.styleFrom(
                    // Set the background color to dark salmon
                    backgroundColor: darkSalmon,
                    // and its minimum size is  60 x 60
                    minimumSize: const Size(60, 60),
                    // Elevate button by 10
                    elevation: 10,
                  ),
                ),
              ),
            ],),
          )
        ],
      )
    );
  }

  // Method for changing the state of the todo item
  void _handleToDoChange(ToDo todo) {
    // When users tap a todo list tile
    setState(() {
      // Set the isDone bool attribute of that todo item to its opposite value
      // either done or undone it
      todo.isDone = !todo.isDone;
    });
  }

  // Method for deleting a todo item
  void _deleteToDoItem(String id) {
    // By passing the id of the item that will be deleted
    setState(() {
      // Search the item that has input id and remove it from the todoList
      todoList.removeWhere((item) => item.id == id);
    });
  }

  // Method for adding a to do item
  void _addToDoItem(String toDo) {
    // Instantiated a new ToDo object and append it to the todoList
    setState(() {
      // Use the current time as the id for that todo Item
      // Use the text input acquired from the text field's controller to populate the text in todo item
      todoList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    // Clear the text field of the input box
    _todoController.clear();
  }

  // Method for filtering the displayed todo list given the search word
  void _runFilter(String enteredKeyword) {
    // A List of todo of search results
    List<ToDo> results = [];
    // If no keyword is given, show all items
    if (enteredKeyword.isEmpty) {
      results = todoList;
    } else {
      // If search word is given check which todo item's text match with the given keyword
      // Convert both keyword and todo text to lowercase so search is not case-sensitive
      results = todoList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Change the todo item list stored in the _foundToDo variable
    setState(() {
      _foundToDo = results;
    });
  }

  // A helper method for generating a Search Bar component
  Container searchBar() {
    // Wrap the search bar into a container
    return Container(
      // Decorate the input box
      decoration: BoxDecoration(
        // Set the background color of the input box to white
        color: Colors.white,
        // Round the corners of the input box with radius 20
        borderRadius: BorderRadius.circular(20)
      ),
      // Text input for the search bar
      child: TextField(
        // Call _runFilter when text is entered or deleted
        onChanged: _runFilter,
        // Align the input text at the start of the text field
        textAlign: TextAlign.start,
        // Style the input text  
        decoration: InputDecoration(
          // Pad the content from all side with 5
          contentPadding: EdgeInsets.all(5),
          // Set a search Icon before the text input
          prefixIcon: Icon(Icons.search),
          // Set the max and min height for the Icon 
          prefixIconConstraints: BoxConstraints(maxHeight: 30, minHeight: 20),
          // No input border
          border: InputBorder.none,
          // Hint text which will be displayed when no text is entered
          hintText: 'Search',
          // Style the hint text
          hintStyle: TextStyle(color: Colors.black)
        ),
      ),
    );
  }
}