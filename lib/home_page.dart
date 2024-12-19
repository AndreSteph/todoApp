// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> tasks = [
    "Daily UI Challenge",
    "Instagram posting",
    "Reading an article about UX/UI",
    "Go to the market"
  ];

  void _addTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTask = '';
        return AlertDialog(
          title: Text('Add Task'),
          content: TextField(
            onChanged: (value) {
              newTask = value;
            },
            decoration: InputDecoration(hintText: 'Enter task name'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (newTask.isNotEmpty) {
                  setState(() {
                    tasks.add(newTask);
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _editTask(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String updatedTask = tasks[index];
        return AlertDialog(
          title: Text('Edit Task'),
          content: TextField(
            onChanged: (value) {
              updatedTask = value;
            },
            controller: TextEditingController(text: tasks[index]),
            decoration: InputDecoration(hintText: 'Edit task name'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (updatedTask.isNotEmpty) {
                  setState(() {
                    tasks[index] = updatedTask;
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteTask(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Task'),
          content: Text('Are you sure you want to delete this task?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  tasks.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: const Icon(Icons.list, color: Colors.white, size: 30),
        title: const Text("Dashboard", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: const Image(
                alignment: Alignment.center,
                image: AssetImage('assets/images/user.jpg'),
                height: 45.0,
                width: 45.0,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: const Border(
                  left: BorderSide(color: Colors.blue, width: 1),
                  right: BorderSide(color: Colors.blue, width: 1),
                  bottom: BorderSide(color: Colors.blue, width: 1),
                  top: BorderSide(color: Colors.blue, width: 1),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                      child: Text(
                        "Manage your time well",
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ),
                    Expanded(
                      child: Image(
                        alignment: Alignment.topRight,
                        image: AssetImage('assets/images/logo.png'),
                        height: 70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Categories section
            const Text(
              "Categories",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryItem(
                    icon: Icons.card_giftcard_outlined,
                    label: "Work",
                    onTap: () {
                      // Handle Work category tap
                    },
                  ),
                  _buildCategoryItem(
                    icon: Icons.person_2_outlined,
                    label: "Personal",
                    onTap: () {
                      // Handle Personal category tap
                    },
                  ),
                  _buildCategoryItem(
                    icon: Icons.shopping_cart_checkout_outlined,
                    label: "Shopping",
                    onTap: () {
                      // Handle Shopping category tap
                    },
                  ),
                  _buildCategoryItem(
                    icon: Icons.heart_broken_outlined,
                    label: "Health",
                    onTap: () {
                      // Handle Health category tap
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Tasks for today",
                style: TextStyle(fontSize: 16),
              ),
            ),

            // Todo List Section
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading:
                        Icon(Icons.donut_large_rounded, color: Colors.blue),
                    title: Text(tasks[index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.green),
                          onPressed: () => _editTask(index),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteTask(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  int pageIndex = 0;
  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? Icon(Icons.home_filled, color: Colors.blue, size: 35)
                : Icon(Icons.home_outlined, size: 35),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? Icon(Icons.work_rounded, color: Colors.blue, size: 35)
                : Icon(Icons.work_outline_outlined, size: 35),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? Icon(Icons.widgets_rounded, color: Colors.blue, size: 35)
                : Icon(Icons.widgets_outlined, size: 35),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? Icon(Icons.settings, color: Colors.blue, size: 35)
                : Icon(Icons.settings_outlined, size: 35),
          ),
        ],
      ),
    );
  }
}

Widget _buildCategoryItem({
  required IconData icon,
  required String label,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      width: 80,
      child: Column(
        children: [
          Icon(icon, color: Colors.blue, size: 35),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 16)),
        ],
      ),
    ),
  );
}
