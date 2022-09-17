Yida Chen

# Content

- lib/main.dart: The main file of our application
- lib/constants/colors.dart: Color object with pre-defined colors that are used to decorate widgets inside app  
- lib/model/todo.dart: Model object for todo items. It is used to store the data, such as id and todo info, of a todo item  
- lib/screens/home.dart: Visual layout and the control logic of the todo app
- lib/widgets/todo_widgets.dart: Visual layout and the control logic of the todo widget

# Get Started

1. Install the Flutter from [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)
2. Configure the Flutter on your code editor
3. Start the app on the emulator or the physical devices from your editor
    - For the Visual Studio Code users, you can install the Flutter plugin and select a test device from the bottom tool bar. To start the testing, go to the Run menu at the top tool bar and click *Start Debugging*
    - This app has been tested on Chrome platform
4. To add a todo item, enter your todo in the bottom input box and click the red plus button on the right. 
5. The added new todo item will be displayed under the green "All TODO Items" title.
6. To delete a todo item, click the red trash bin button on the right-most of your todo item.
7. To search for a todo item, type in your keyword in the top input box. The todo item with matched keyword will show up in the list. The search is not case-sensitive.

# References:
The creation of this TODO app follow the instructions and code examples from this tutorial:  
[1] "Flutter ToDo App Tutorial for Beginners," Pradip Debnath, [https://www.youtube.com/watch?v=K4P5DZ9TRns](https://www.youtube.com/watch?v=K4P5DZ9TRns)

# Reflection:
Compared with the CSS + JS + HTML and Node.JS + Mongodb, Flutter is a more uniform platform for developing cross-platform application. Everything, from the visual layout to the control logic, is coded in the dart language, making the resulting app easier to manage. Moreover, we don't need to worry about cross-platform deployment. The same code can generate apps that work on different devices (mobile or desktop) with all kinds of systems (Windows, Android, iOS, etc.). I think cross-platform compatibility is the biggest advantage of Flutter over other available tools. 