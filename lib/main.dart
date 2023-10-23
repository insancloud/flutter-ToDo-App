import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple ToDo App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        // useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List todoList = [];
  String todoName = "";

  // Fungsi add String
  addString(content) {
    setState(() {
      todoName = content;
    });
  }

  addList() {
    setState(() {
      todoList.add({"value": todoName});
    });
  }

  deleteItem(index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 75,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 90,
              child: ListView.builder(
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.blue[900],
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 80,
                                child: Text(todoList[index]["value"].toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Expanded(
                                flex: 20,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          deleteItem(index);
                                        });
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.indigo[900],
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    flex: 70,
                    child: Container(
                      height: 50,
                      child: TextFormField(
                        onChanged: (content) {
                          addString(content);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          fillColor: Colors.blue[300],
                          filled: true,
                          labelText: "Create Task",
                          labelStyle: TextStyle(
                              color: Colors.indigo[900],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      width: 5,
                    ),
                  ),
                  Expanded(
                    flex: 27,
                    child: ElevatedButton(
                      onPressed: () {
                        addList();
                      },
                      child: Container(
                        height: 15,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text("Add Task"),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
