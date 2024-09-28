import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('  Privacy Policy',style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Introduction',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'This Privacy Policy describes how  ("we", "us", or "our") collects, uses, and discloses your information when you use our mobile application, the ("Smart Home Automation System").',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20.0),
            Text(
              'Information We Collect',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'We collect the following information when you use our app:',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10.0),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('User information: This may include your name, email address, and any other information you provide when creating an account.'),
            ),
            ListTile(
              leading: Icon(Icons.device_hub),
              title: Text('Device information: This may include information about the smart home devices you connect to the app, such as their type, model, and unique identifiers.'),
            ),

            ListTile(
              leading: Icon(Icons.text_format),
              title: Text('Usage data: This may include information about how you use the app, such as the features you access and the actions you take.'),
            ),
            SizedBox(height: 20.0),
            Text(
              'How We Use Your Information',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'We use your information for the following purposes:',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10.0),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('To provide and improve the app: We use your information to operate the app, deliver its features, and improve your overall experience.'),
            ),
            ListTile(
              leading: Icon(Icons.security),
              title: Text('To maintain security: We use your information to maintain the security of the app and protect your data.'),
            ),
            ListTile(
              leading: Icon(Icons.analytics),
              title: Text('For analytics: We may use your information for analytics purposes to understand how users interact with the app and improve its functionality.'),
            ),
            SizedBox(height: 20.0),
            // Add more sections as needed (Your Choices, Disclosure of Your Information, etc.)
          ],
        ),
      ),
    );
  }
}
