import 'package:flutter/material.dart';


class contactus extends StatelessWidget{
  const contactus({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(

        backgroundColor: Colors.blue,
        title: const Text('ConatctUs',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          heightFactor: 1.5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 37.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 16.0,),
                const TextField(
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'Name',
                      border: InputBorder.none

                  ),
                ),
                const SizedBox(height: 9.0),
                const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Email',
                    border: InputBorder.none,
                  ),
                ),
                const SizedBox(height: 9.0),
                const TextField(
                  maxLines: 7,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Message',
                    border: InputBorder.none,
                  ),
                ),
                const SizedBox(height: 9.0),
                MaterialButton(
                  color: Colors.blue,

                  onPressed: (){
                  },
                  child: const Text("Submit", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  ),

                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}




