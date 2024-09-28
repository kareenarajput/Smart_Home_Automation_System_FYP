import 'package:flutter/material.dart';

class faqs extends StatefulWidget {
  const faqs({super.key});

  @override
  _faqsState createState() => _faqsState();
}

class _faqsState extends State<faqs> {
  List<Map<String, String>> faqData = [
    {
      'question': 'How do I set up my home automation system?',
      'answer':
      'To set up your home automation system, download the mobile app, connect your devices, and follow the in-app instructions. Our support team is also available to assist you if you have any questions.'
    },
    {
      'question': 'Can I control my home automation system remotely?',
      'answer':
      'Yes, you can control your home automation system remotely using the mobile app. This allows you to manage your devices and settings from anywhere.'
    },
    {
      'question': 'What types of devices are compatible with the system?',
      'answer':
      'Our home automation system is compatible with a wide range of smart devices, including lights, thermostats, security cameras, and more. You can check the list of compatible devices on our website.'
    },
    {
      'question': 'How do I troubleshoot issues with my home automation system?',
      'answer':
      'If you encounter any issues with your home automation system, please refer to the troubleshooting guide in the mobile app or contact our support team. They will be happy to assist you in resolving the problem.'
    },
    {
      'question': 'Can I customize the settings and automations?',
      'answer':
      'Yes, the home automation system allows you to customize the settings and create personalized automations to suit your preferences. You can access these features through the mobile app.'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ', style: TextStyle(color: Colors.white,
            fontSize: 16.0)),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Welcome to our SMART Home Automation System FAQs.',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 2.0,),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Below you will find answers to some of the most frequently asked questions about our system.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: faqData.length,
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    title: Text(faqData[index]['question']!),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Text(faqData[index]['answer']!),
                      ),

                    ],

                  );
                },
              ),
            ),
            const SizedBox(height: 3.0,),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Still stuck? Help is just a tap away!',
                style: TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(height: 3.0),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
              },
              child: const Text("Contact Us", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              ),

            ),
          ],
        ),
      ),


    );
  }
}

