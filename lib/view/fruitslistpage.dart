import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:listify/function/groseryListFunctions.dart';

List<String> options = ["inCompleted", "completed"];

// ignore: must_be_immutable
class Fruitslistpage extends StatefulWidget {
  String? catogary;
  Fruitslistpage({
    super.key,
    required this.catogary,
  });

  @override
  State<Fruitslistpage> createState() => _FruitslistpageState();
}

class _FruitslistpageState extends State<Fruitslistpage> {
  String? currntOption;

  @override
  Widget build(BuildContext context) {
    getAllgroseryData();
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.line_style),
          title: Text('Your List Of Fruits'),
        ),
        body: ValueListenableBuilder(
          valueListenable: groseryListNotifyr,
          builder: (context, value, child) {
            final cato =
                value.where((cat) => cat.catocary == widget.catogary).toList();

            if (cato.isEmpty) {
              return Center(
                child: Text("no data"),
              );
            }
            return ListView.builder(
              itemCount: cato.length,
              itemBuilder: (context, index) {
                final data = cato[index];
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: ExpansionTile(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 244, 203),
                            title: Center(
                                child: Text(
                              data.groceryName!,
                              style: TextStyle(fontSize: 18),
                            )),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(data.quantity!),
                                        Gap(20),
                                        IconButton(
                                            onPressed: () {
                                              deleteGroseryData(index);
                                            },
                                            icon: Icon(Icons.delete))
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text('completed'),
                                            Radio(
                                                value: options[0],
                                                groupValue: currntOption,
                                                onChanged: (value) {
                                                  setState(() {
                                                    currntOption =
                                                        value.toString();
                                                  });
                                                }),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text('Not Completed'),
                                            Radio(
                                                value: options[1],
                                                groupValue: currntOption,
                                                onChanged: (value) {
                                                  setState(() {
                                                    currntOption =
                                                        value.toString();
                                                  });
                                                }),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Gap(10)
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
