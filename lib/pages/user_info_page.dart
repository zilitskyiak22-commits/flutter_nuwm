import 'package:flutter/material.dart';
import '../models/user.dart';

class UserInfoPage extends StatelessWidget {
  final User user;

  const UserInfoPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Info")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${user.name}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text("Phone: ${user.phone}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text("Email: ${user.email}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text("Country: ${user.country}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text("Story: ${user.story}", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
