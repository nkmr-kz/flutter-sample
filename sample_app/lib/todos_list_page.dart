import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<Todo> _todos = <Todo>[];

  // prepare todo list initially
  @override
  void initState() {
    _todos.add(const Todo(title: 'Buy milk'));
    _todos.add(const Todo(title: 'Buy eggs'));
    _todos.add(const Todo(title: 'Buy bread'));

    print(_todos.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (BuildContext context, int index) {
          final Todo todo = _todos[index];
          return Dismissible(
            key: Key(todo.title ?? ''),
            onDismissed: (direction) {
              // imediatelly remove item from list
              setState(() {
                _todos.removeAt(index);
              });
            },
            child: Card(
              child: ListTile(
                title: Text(todo.title ?? "-"),
                onTap: () {
                  setState(() {
                    _todos[index] = Todo(
                      title: todo.title,
                      isDone: !todo.isDone,
                    );
                  });
                },
                trailing: todo.isDone ? const Icon(Icons.check) : null,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showTodoAddDialog(
            context: context,
            onAdd: (String title) {
              setState(() {
                _todos.insert(
                    0,
                    Todo(
                      title: title,
                      isDone: false,
                    ));
              });
            },
          );
        },
        tooltip: "Increment",
        child: const Icon(Icons.add),
      ),
    );
  }

  void showTodoAddDialog(
      {required BuildContext context,
      required Null Function(String title) onAdd}) {
    setState(() {
      _todos.insert(
          0,
          const Todo(
            title: "title",
            isDone: false,
          ));
    });
  }
}

class Todo {
  const Todo({
    this.title = "",
    this.isDone = false,
  });
  final String? title;
  final bool isDone;
}
