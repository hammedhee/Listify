import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:listify/function/groseryListFunctions.dart';
import 'package:listify/view/viewlistpage.dart';

class Fruitslistpage extends StatelessWidget {
  final String? catogary;

  Fruitslistpage({super.key, required this.catogary});

  @override
  @override
  Widget build(BuildContext context) {
    getAllgroseryData();
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.line_style),
        title: const Text("Your List's"),
      ),
      body: ValueListenableBuilder(
        valueListenable: groseryListNotifyr,
        builder: (context, value, child) {
          log("message");
          final filteredList =
              value.where((grocery) => grocery.catocary == catogary).toList();
          if (filteredList.isEmpty) {
            return const Center(
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
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onLongPress: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) {
                          return Viewlistpage(
                            name: data.groceryName,
                            weight: data.quantity,
                          );
                        }));
                      },
                      child: ExpansionTile(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 226, 193),
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.edit)),
                                        IconButton(
                                          onPressed: () {
                                            deleteGroseryData(index);
                                          },
                                          icon: const Icon(Icons.delete),
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
