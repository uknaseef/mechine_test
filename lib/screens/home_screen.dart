import 'package:flutter/material.dart';
import 'package:mechine_test/screens/login_page.dart';
import 'package:mechine_test/services/user_controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences sharedpreferences;
  String? username;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    sharedpreferences = await SharedPreferences.getInstance();
    setState(() {
      username = sharedpreferences.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserGetService>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                '$username',
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {
                provider.logout(context);
              },
              child: const Text('LogOut'),
            )
          ],
        ),
      ),
    );
  }
}
