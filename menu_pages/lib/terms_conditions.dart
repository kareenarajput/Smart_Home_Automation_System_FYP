import 'package:flutter/material.dart';



class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:  const Text('Terms & Conditions',
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            const Text(
              'New updated APP 2024',
              style: TextStyle(fontSize: 15.0, color: Colors.grey),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'TERMS AND CONDITIONS ',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '1. Introduction\n',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2.0),
            const Text(
              'These terms and conditions outline the rules and regulations for the use of our Smart Home App.By accessing this app, we assume you accept these terms and conditions. Do not continue to use our app if you do not agree to all of the terms and conditions stated on this page.\n',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10.0),
            const Text(
              '2. Acceptance of Terms\n',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2.0),
            const Text(
              'By using the System, you agree to be bound by the terms and conditions of this Agreement.If you do not agree to all the terms and conditions of this Agreement, you are not authorized to use the System.\n',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10.0),
            const Text(
              '3. Service and Support\n',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2.0),
            const Text(
              'Company will provide basic technical support for the System during its business hours.Extended support options may be available for an additional fee,Company is not responsible for troubleshooting issues related to the customer internet connection or incompatible devices\n',
              style: TextStyle(fontSize: 16.0),
            ),

            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {},

                  child: const Text('Decline',style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 10.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {

                  },
                  child: const Text('Accept', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


