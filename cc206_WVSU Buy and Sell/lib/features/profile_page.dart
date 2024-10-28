import 'package:flutter/material.dart';
import 'edit_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _introduction = 'Introduction about self';
  String _userName = "User's name";

  void _navigateEditProfile() async {
    final updatedValues = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(
          currentIntroduction: _introduction,
          currentName: _userName, introduction: '',
        ),
      ),
    );

    if (updatedValues != null) {
      setState(() {
        _introduction = updatedValues['introduction'] ?? _introduction;
        _userName = updatedValues['name'] ?? _userName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Profile'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
            ),
            const SizedBox(height: 20),
            Text(
              _userName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 5),
            Text(
              _introduction,
              style: TextStyle(
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _navigateEditProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: const Text('Edit profile'),
            ),
          ],
        ),
      ),
    );
  }
}
