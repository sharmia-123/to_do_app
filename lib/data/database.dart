import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabse{

  List toDoList = [

  ];
  final _mybox = Hive.box('my box');

  // run this method if this is the first time opening the method
  void createInitialData()
  {
    toDoList = [
      ["Clean Room", false],
      ["Drink Water", false],
    ];
  }
  // load the data from the database
  void loadData()
  {
    toDoList = _mybox.get("TODOLIST");
  }
  // update the databse
  void updateData()
  {
    _mybox.put("TODOLIST", toDoList);
  }
}