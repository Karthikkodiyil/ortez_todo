import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ortez_machine_test/model/todo_model.dart';
import 'package:ortez_machine_test/network/repository/todo_repo.dart';
import 'package:ortez_machine_test/view/home_view.dart';
import 'package:ortez_machine_test/view/todo_detail_view.dart';

class TodoViewmodel extends ChangeNotifier {
  List<TodoModel> _taskList = [];
  List<TodoModel> get taskList => _taskList;

  List<TodoModel> _serchList = [];
  List<TodoModel> get serchList => _serchList;

  TodoModel? _selectedTodo;
  TodoModel? get selectedTodo => _selectedTodo;

  bool? _isCompleted;
  bool? get isCompleted => _isCompleted;

  bool _isSearchBar = false;
  bool get isSearchBar => _isSearchBar;

  bool? _isNewTodo;
  bool? get isNewTodo => _isNewTodo;

  TextEditingController titleController = TextEditingController();
  TextEditingController discController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  void homePageNavigation(BuildContext context) {
    getTodoList().then((value) {
      Future.delayed(const Duration(seconds: 7))
          .then((_) => Navigator.pushReplacement(
              // ignore: use_build_context_synchronously
              context,
              MaterialPageRoute(builder: (context) => const HomeView())));
    });
  }

  Future<void> getTodoList() async {
    TodoRepo.getTodo().then((value) {
      _taskList = value;
      _serchList = value;
    }).onError((error, stackTrace) {
      log(error.toString());
    });
  }

  void toggleCheck(TodoModel value) {
    Map<String, dynamic> payload = {
      "userId": value.userId,
      "id": value.id,
      "title": value.title,
      "completed": !value.completed,
    };
    log(payload.toString());
    TodoRepo.putTodo(payload, value.id).then((_) {
      getTodoList();
    });
    notifyListeners();
  }

  void toggleStatus(bool value) {
    _isCompleted = value;
    notifyListeners();
  }

  void detailsNavigation(BuildContext context, TodoModel value) {
    setSelectedTodo(value);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const TodoDetailView()));
  }

  void popFunction(BuildContext context) {
    Navigator.pop(context);
  }

  void setSelectedTodo(TodoModel value) {
    _selectedTodo = value;
    titleController.text = value.title;
    discController.text = "";
    _isCompleted = value.completed;
    _isNewTodo = false;
  }

  void updateTodo(TodoModel value, BuildContext context) {
    Map<String, dynamic> payload = {
      "userId": value.userId,
      "id": value.id,
      "title": titleController.text.trim(),
      "completed": isCompleted,
    };
    TodoRepo.putTodo(payload, value.id).then((_) => getTodoList());
    popFunction(context);
    notifyListeners();
  }

  void addNewTodoNavigation(BuildContext context) {
    titleController.clear();
    discController.clear();
    _isCompleted = false;
    _isNewTodo = true;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const TodoDetailView()));
  }

  void addNewTodo(BuildContext context) {
    Map<String, dynamic> payload = {
      "userId": 1,
      "id": 201,
      "title": titleController.text.trim(),
      "completed": isCompleted,
    };
    TodoRepo.postTodo(payload);
    Navigator.pop(context);
  }

  void toggleSearchBar() {
    searchController.clear();
    _isSearchBar = !_isSearchBar;
    _serchList = _taskList;
    notifyListeners();
  }

  void searchTodo(String value) {
    String search = value.trim();
    _serchList =
        _taskList.where((item) => item.title.contains(search)).toList();
    notifyListeners();
  }

  void savefunction(context) {
    if (isNewTodo ?? false) {
      addNewTodo(context);
    } else {
      updateTodo(selectedTodo!, context);
    }
  }
}
