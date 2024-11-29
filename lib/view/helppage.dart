import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
        backgroundColor: const Color.fromARGB(255, 114, 199, 255),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "How can we help you?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Below are some common questions and answers. If you need further assistance, feel free to contact us.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              ExpansionTile(
                title: Text(
                  "How do I add items to my list?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "To add items, go to the 'Add Items' page, fill in the details like name, category, and quantity, then tap the 'Add to List' button.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  "How do I edit or delete an item?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "To edit or delete an item, go to your list, tap on the item, and choose the edit or delete option.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  "Can I categorize my lists?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Yes! You can categorize your items by selecting a category while adding them to the list.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  "Is my data stored securely?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "All your data is stored locally on your device. Make sure to back it up if needed.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Still need help?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "If you have any further questions or issues, please feel free to contact us:",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.email, color: Colors.blueAccent),
                  SizedBox(width: 8),
                  Text(
                    "support@listifyapp.com",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.phone, color: Colors.blueAccent),
                  SizedBox(width: 8),
                  Text(
                    "+1 234 567 890",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 124, 218, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Contact Support"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
