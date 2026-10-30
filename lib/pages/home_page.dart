import 'package:flutter/material.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/utils/dialog_box.dart';
import 'package:to_do_app/utils/to_do_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

ToDoDatabse db = ToDoDatabse();
final _mybox = Hive.box('my box');

@override
  void initState() {
    // TODO: implement initState
    // if this is the first time opening the app then create the default data

    if(_mybox.get("TODOLIST") == null)
    {
      db.createInitialData();
    }
    // if data already exist
    else
    {
      db.loadData();
    }
    super.initState();
  }
// create a list with 2 task
// check box tap function
void checkBoxchanged(bool? value, int index)
{
  setState(() {
    db.toDoList[index][1] = !db.toDoList[index][1];
  });
  // update database
  db.updateData();
}
final _controller = TextEditingController();

// save new task
void savenewTask()
{
  setState(() {
    db.toDoList.add([_controller.text, false]);
  });
  Navigator.pop(context);
  // update database
  db.updateData();
}
// create a new task
void createNewTask()
{
  setState(() {
    showDialog(context: context, builder: (context)
    {
      return DialogBox(
        taskcontroller: _controller,
        onsave: savenewTask,
        oncancel: ()=> Navigator.pop(context),
      );
    });
  });
}
// delete task 
void deleteTask(int index)
{
  setState(() {
    db.toDoList.removeAt(index);
  });
  // update database
  db.updateData();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("TO DO",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.yellow[200],
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context , index)
      {
        return ToDoTile(taskname: db.toDoList[index][0],
        taskcompleted:  db.toDoList[index][1],
        onChanged: (value) => checkBoxchanged(
          value,index,
        ),
        deleteFunction: (context) => deleteTask(index),
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
    );
  }
}