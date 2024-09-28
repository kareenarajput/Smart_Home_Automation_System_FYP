import 'package:flutter/material.dart';
import 'package:menu_pages/aboutus.dart';
import 'package:menu_pages/contactus.dart';
import 'package:menu_pages/faqs.dart';
import 'package:menu_pages/terms_conditions.dart';

class HelpSupport extends StatelessWidget{
  const HelpSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(' Help&Support ',style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '    Need Any Help or Queries Freely Contact to Us   ',
                  style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
                ),

              ],
            ),
          ),
          const Divider(thickness: 2),

          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(25),
              crossAxisCount: 2,
              children: <Widget>[
                Card(
                  margin: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const AboutUs()));
                    },
                    splashColor: Colors.blue,
                    child: const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.insert_drive_file, size: 60, color: Colors.blueAccent,),
                          Text("About Us", style: TextStyle(fontSize: 15.0)),

                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const contactus()));
                    },
                    splashColor: Colors.blue,
                    child: const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.phone, size: 60, color: Colors.redAccent,),
                          Text("ContactUs", style: TextStyle(fontSize: 15.0)),

                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const faqs()));
                    },
                    splashColor: Colors.blue,
                    child: const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.question_mark, size: 60, color: Colors.greenAccent,),
                          Text("FAQs", style: TextStyle(fontSize: 15.0)),

                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const TermsAndConditions()));
                    },
                    splashColor: Colors.blue,
                    child: const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.task_rounded, size: 60, color: Colors.blueGrey,),
                          Text("Terms & Conditions", style: TextStyle(fontSize: 15.0)),

                        ],
                      ),
                    ),
                  ),
                ),



              ],
            ),
          ),
        ],
      ),
    );
  }

}