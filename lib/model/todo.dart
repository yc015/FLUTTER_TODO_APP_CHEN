// Model class for the ToDo object

class ToDo {
  // id of the ToDo item
  String? id;
  // Text (description) of the ToDo item
  String? todoText;
  // bool indicate if this item is done or not (will affect the display of the widget)
  bool isDone;

  // Constructor of the ToDo class
  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  // A static method that initiate the todoList
  static List<ToDo> todoList() {
    return [];
  }
}