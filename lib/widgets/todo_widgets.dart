import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_chen/constants/colors.dart';
import 'package:todo_app_chen/model/todo.dart';


// The ToDoItem widget class 
// This class define the visual layout and control of this ToDoItem widget
class ToDoItem extends StatelessWidget {
  // todo model object that records item id, text, and 
  final ToDo todo;
  // function that will be invoked when ToDoItem changes
  final onToDoChanged;
  // function that will be invoked when ToDoItem is deleted
  final onDeleteItem;

  // Constructor of the ToDoItem
  const ToDoItem({Key? key, required this.todo, required this.onToDoChanged, required this.onDeleteItem,}) : super(key: key);

  // override build method for the ToDoItem widget class
  // This function will be called when the ToDoItem widget is inserted into the tree
  // This function returns a ToDoItem widget
  @override
  Widget build(BuildContext context) {
    return Container(
      // Set bottom margin of the container box to 20
      margin: EdgeInsets.only(bottom: 20),
      // The container has a ListTile as the child
      child: ListTile(
        // When the ListTile is being tapped
        onTap: () {
          // Invoke onToDoChanged function (which will cross/uncross the text in this ListTile)
          onToDoChanged(todo);
        },
        // Defined the visual shape of this ListTile
        shape: RoundedRectangleBorder(
          // Use ciruclar rounded border with radius=20
          borderRadius: BorderRadius.circular(20),
        ),
        // Pad the content symmetrically by 20 on the horizontal axis and 10 on the vertical axis
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        // Set the background color of this tile
        tileColor: Colors.white,
        // Have a checkbox as the leading Icon which can be checked and unchecked when users tap this tile
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: greyGreen,
        ),

        title: Text(
          todo.todoText!, // ! operator converts the String text from a nullable type to a non-nullable type
          // Styling the Text inside the ToDoItem
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: todo.isDone ? TextDecoration.lineThrough : null, // Cross the text if todo is done
          ),
        ),
        // Widget displayed after the title
        trailing: Container(
          // pad the content symmetrically on the vertical axis by 5
          margin: EdgeInsets.symmetric(vertical: 5),
          // Set the height and width of this container to 35
          height: 35,
          width: 35,
          // Style the container box
          decoration: BoxDecoration(
            // Use darkSalmon as the background color
            color: darkSalmon,
            // And round the border with radius 5
            borderRadius: BorderRadius.circular(5),
          ),
          // Add the delete Icon into this box
          child: IconButton(
            // Use white as the color of the Icon
            color: Colors.white,
            // Set the size of the icon
            iconSize: 18,
            // Use delete icon from the flutter library
            icon: Icon(Icons.delete),
            // Call onDeleteItem function when this widget is pressed
            onPressed: () {
              // Pass the id of the todo item, so we know which widget we will delete
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}