import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:listify/function/groseryListFunctions.dart';
import 'package:listify/model/groceryList.dart';

List<String> options = ["inCompleted", "completed"];

class Fruitslistpage extends StatefulWidget {
  final String? catogary;

  Fruitslistpage({super.key, required this.catogary});

  @override
  State<Fruitslistpage> createState() => _FruitslistpageState();
}

class _FruitslistpageState extends State<Fruitslistpage> {
  @override
  void initState() {
    super.initState();
    getAllgroseryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.line_style),
        title: Text('Your List Of Fruits'),
      ),
      body: ValueListenableBuilder(
        valueListenable: groseryListNotifyr,
        builder: (context, value, child) {
          final filteredList =
              value.where((item) => item.catocary == widget.catogary).toList();

          if (filteredList.isEmpty) {
            return Center(
              child: Text(
                "No List",
                style: TextStyle(fontSize: 20),
              ),
            );
          }

          return ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              final data = filteredList[index]; 
              final isCompleted = data.value == true;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ExpansionTile(
                      backgroundColor: const Color.fromARGB(255, 255, 226, 193),
                      title: Center(
                        child: Text(
                          data.groceryName ?? "",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(data.quantity ?? ""),
                                  IconButton(
                                    onPressed: () {
                                      deleteGroseryData(index);
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text('Completed'),
                                      Radio(
                                        value: true,
                                        groupValue: isCompleted,
                                        onChanged: (value) {
                                          setState(() {
                                            final updatedData = GroceryListData(
                                              groceryName: data.groceryName,
                                              quantity: data.quantity,
                                              catocary: data.catocary,
                                              value: value as bool,
                                            );
                                            editGrosery(index, updatedData);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Not Completed'),
                                      Radio(
                                        value: false,
                                        groupValue: isCompleted,
                                        onChanged: (value) {
                                          setState(() {
                                            final updatedData = GroceryListData(
                                              groceryName: data.groceryName,
                                              quantity: data.quantity,
                                              catocary: data.catocary,
                                              value: value as bool,
                                            );
                                            editGrosery(index, updatedData);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(10),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
