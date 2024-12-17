import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:listify/function/groseryListFunctions.dart';
import 'package:listify/model/groceryList.dart';

class Fruitslistpage extends StatefulWidget {
  final String? catogary;

  Fruitslistpage({super.key, required this.catogary});

  @override
  State<Fruitslistpage> createState() => _FruitslistpageState();
}

class _FruitslistpageState extends State<Fruitslistpage> {
  late List<GroceryListData> filteredList;

  @override
  void initState() {
    super.initState();
    getAllgroseryData();
    filteredList = groseryListNotifyr.value
        .where((item) => (item.catocary ?? '').toLowerCase() == 
             (widget.catogary ?? '').toLowerCase())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.line_style),
        title: const Text('Your List Of Fruits'),
      ),
      body: ValueListenableBuilder(
        valueListenable: groseryListNotifyr,
        builder: (context, value, child) {
          if (value.isEmpty) {
            return const Center(
              child: Text(
                "No List",
                style: TextStyle(fontSize: 20),
              ),
            );
          }

          filteredList = value
              .where((item) =>
                  (item.catocary ?? '').toLowerCase() ==
                  (widget.catogary ?? '').toLowerCase())
              .toList();

          return ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              final data = filteredList[index];
              final isCompleted = data.value;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ExpansionTile(
                      backgroundColor: const Color.fromARGB(255, 255, 226, 193),
                      title: Center(
                        child: Text(
                          data.groceryName ?? "",
                          style: const TextStyle(fontSize: 18),
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
                                  Flexible(
                                    child: Text(
                                      data.quantity ?? "",
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      deleteGroseryData(index);
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Text('Completed'),
                                      Radio(
                                        value: true,
                                        groupValue: isCompleted,
                                        onChanged: (value) {
                                          final updatedData = GroceryListData(
                                            groceryName: data.groceryName,
                                            quantity: data.quantity,
                                            catocary: data.catocary,
                                            value: value as bool,
                                          );
                                          editGrosery(index, updatedData);
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text('Not Completed'),
                                      Radio(
                                        value: false,
                                        groupValue: isCompleted,
                                        onChanged: (value) {
                                          final updatedData = GroceryListData(
                                            groceryName: data.groceryName,
                                            quantity: data.quantity,
                                            catocary: data.catocary,
                                            value: value as bool,
                                          );
                                          editGrosery(index, updatedData);
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
                    const Gap(10),
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
  