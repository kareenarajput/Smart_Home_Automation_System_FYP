import 'package:flutter/material.dart';
import 'package:menu_pages/myprofile/Logout.dart';
import 'package:menu_pages/myprofile/Routines.dart';
import 'package:menu_pages/myprofile/help&Support.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import for SharedPreferences
import 'package:menu_pages/signin.dart';


class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Colors.blueGrey, // Change to a friendlier color
                    child: Text(
                      'K',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ), // User initials
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kareena Rajput',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const Text(
                        'My Home',
                        style: TextStyle(color: Colors.black54), // Location
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            // Navigation Section
            ListView(
              shrinkWrap: true, // Prevent unintended scrolling
              physics: const NeverScrollableScrollPhysics(), // Disable scrolling
              children: [
                ListTile(
                  leading: const Icon(Icons.schedule, color: Colors.blue),
                  title: const Text('Routines', style: TextStyle(color: Colors.black)),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RoutinesPage()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.blue),
                  title: const Text('Settings', style: TextStyle(color: Colors.black)),
                  onTap: () {
                    // Handle settings functionality
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.help, color: Colors.blue),
                  title: const Text('Help & Support', style: TextStyle(color: Colors.black)),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpSupport()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text('Logout', style: TextStyle(color: Colors.black)),
                  onTap: () async {
                    await _logout(context); // Call the logout method
                  },
                ),
              ],
            ),
            const Divider(),
            // Optional Section (Energy Consumption)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Weekly Energy Consumption:', style: TextStyle(color: Colors.black87)),
                  const SizedBox(width: 16.0),
                  Text(
                    '10 kWh',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Logout functionality
  Future<void> _logout(BuildContext context) async {
    // Clear user data from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all preferences

    // Navigate back to the login screen
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SignIn()),
          (route) => false,
    );
  }
}
