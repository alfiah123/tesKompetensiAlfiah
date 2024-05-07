import 'package:flutter/material.dart';
import '../repository/user_repository.dart';
import 'add_user.dart';

class UserCRUDPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Users', style: TextStyle(fontFamily: 'SFPro')),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: UserRepository.users.length,
                itemBuilder: (context, index) {
                  final user = UserRepository.users[index];
                  return ListTile(
                    title: Text(user.username),
                    subtitle: Text(user.address),
                    trailing: Text(user.role),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddUserPage()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
      ),
    );
  }
}
