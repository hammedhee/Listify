import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:listify/function/userdatafunctions.dart';
import 'package:listify/view/fruitslistpage.dart';
import 'package:lottie/lottie.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String userName = '';

  @override
  void initState() {
    super.initState();
    getUserName();
  }

  Future<void> getUserName() async {
    try {
      await getAllUserData();
      if (mounted) {
        setState(() {
          if (userDataNotifire.value.isNotEmpty &&
              userDataNotifire.value.first.userName != null) {
            userName = userDataNotifire.value.first.userName!;
          } else {
            userName = 'Guest';
          }
        });
      }
    } catch (e) {
      print('Error fetching user data: $e');
      if (mounted) {
        setState(() {
          userName = 'Guest';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(30),
                _buildProfileHeader(),
                const Gap(20),
                _buildAnimation(),
                const Gap(20),
                _buildNavigationGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 144, 56, 185),
          ),
          child: const CircleAvatar(
            radius: 32,
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: Image(
                image: AssetImage(
                  'asset/new_defalt_profile_image_for-removebg-preview.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Gap(10),
        Text(
          'Hi $userName',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildAnimation() {
    return Center(
      child: Lottie.asset(
        'asset/Animation for home page.json',
        height: 200,
      ),
    );
  }

  Widget _buildNavigationGrid() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black12,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildNavigationRow([
            NavigationItem(
                title: 'Vegetable List',
                assetPath: 'asset/veg for listyfy.png',
                category: 'Vegetable'),
            NavigationItem(
                title: 'Fruits List',
                assetPath: 'asset/fruits for listify.png',
                category: 'Fruits'),
          ]),
          const Gap(20),
          _buildNavigationRow([
            NavigationItem(
                title: 'Powders List',
                assetPath: 'asset/for_home-removebg-preview.png',
                category: 'Powders'),
            NavigationItem(
                title: 'Other Items List',
                assetPath:
                    'asset/groceries-png-for_listify_home-removebg-preview.png',
                category: 'Others'),
          ]),
        ],
      ),
    );
  }

  Widget _buildNavigationRow(List<NavigationItem> items) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items
          .map((item) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Fruitslistpage(catogary: item.category),
                    ),
                  );
                },
                child: _navigationContainer(item.title, item.assetPath),
              ))
          .toList(),
    );
  }

  Widget _navigationContainer(String title, String assetPath) {
    return Container(
      height: 160,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: Color.fromARGB(31, 0, 0, 0),
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
          const Gap(10),
          Text(
            title,
            style: const TextStyle(
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

class NavigationItem {
  final String title;
  final String assetPath;
  final String category;

  NavigationItem({
    required this.title,
    required this.assetPath,
    required this.category,
  });
}
