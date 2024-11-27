import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(50),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(255, 144, 56, 185)),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'asset/new_defalt_profile_image_for-removebg-preview.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(10),
                  Text(
                    'Hi Muhammed',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Gap(20),
              Center(
                child: Lottie.asset('asset/Animation for home page.json',
                    height: 200),
              ),
              Gap(20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: homePageNavigationContainer(
                                'Vegetable List', 'asset/veg for listyfy.png'),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'fruitspage');
                            },
                            child: homePageNavigationContainer(
                                'Fruits List', 'asset/fruits for listify.png'),
                          ),
                        ],
                      ),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: homePageNavigationContainer('Powders List',
                                'asset/for_home-removebg-preview.png'),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: homePageNavigationContainer(
                                'Other Items List',
                                'asset/groceries-png-for_listify_home-removebg-preview.png'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container homePageNavigationContainer(String title, String assetPath) {
    return Container(
      height: 160,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            assetPath,
            height: 120,
            fit: BoxFit.contain,
          ),
          Gap(10),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
