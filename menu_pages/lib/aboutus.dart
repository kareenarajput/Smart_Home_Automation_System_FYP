import 'package:flutter/material.dart';
class AboutUs extends StatelessWidget{
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500)),
        backgroundColor: Colors.blue,

      ),
      backgroundColor: Colors.white,
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company Logo
              Center(
                child: SizedBox(
                  height: 200,
                  width: 310,
                  child: Icon(
                    Icons.house_outlined, // Use built-in home icon
                    size: 100, // Adjust size as needed
                    color: Colors.blue, // Set color (optional)
                  ),
                ),
              ),

              // About Us Text
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  'Smart Home Automation System',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  'HomeSmart is your ultimate solution for smart home automation. With our app, you can control all aspects of your home remotely and effortlessly, Our smart home app allows you to control and monitor your home devices remotely. With features like scheduling, automation, and real-time notifications, you can make your home smarter and more efficient.',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),

              // Teamwork Section Header
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  'Teamwork',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),

              // Team Text
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'HomeSmart Technologies is dedicated to providing cutting-edge solutions for home automation. Our team consists of passionate individuals committed to simplifying and enhancing the way you interact with your home environment ',
                  style: TextStyle(fontSize: 16.0),
                ),

              ),


            ],
          ),
        ),
      ),

      // Contact Us Button

    );
  }
}



