import 'package:flutter/material.dart';
import 'package:listify/function/groseryListFunctions.dart';

class Fruitslistpage extends StatelessWidget {
  String? catogary;
  Fruitslistpage({
    super.key,
    required this.catogary,
  });

  @override
  Widget build(BuildContext context) {
    getAllgroseryData();
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.line_style),
        ),
        body: ValueListenableBuilder(
          valueListenable: groseryListNotifyr,
          builder: (context, value, child) {
            final cato =
                value.where((cat) => cat.catocary == catogary).toList();

            if (cato.isEmpty) {
              return Center(
                child: Text("no data"),
              );
            }
            return ListView.builder(
              itemCount: cato.length,
              itemBuilder: (context, index) {
                final data = cato[index];
                return ListTile(
                  onTap: () {
                    deleteGroseryData(index);
                  },
                  title: Text(data.groceryName!),
                );
              },
            );
          },
        ));
  }
}
