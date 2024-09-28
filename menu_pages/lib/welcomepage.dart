import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              heightFactor: 1.0,
              child:SizedBox(
                height: 400,
                width: 310,
                child: Image.asset(
                  '/mountain-house.jpg',
                  fit:BoxFit.cover ,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Welcome to',
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
              ),
            ),
            const Text(
              'Smart Home Automation System',
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                'Feel secure! Your smart home is armed,\n'
                    '         ready to keep you safe.        ',
                style: TextStyle(fontSize: 12.5),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 260.0,
                  height: 33.0,
                  child: MaterialButton(
                    color: Colors.blue,

                    onPressed: (){
                    },
                    child: const Text("Login", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    ),

                  ),
                ),

                const SizedBox(height: 25.0,),
                SizedBox(
                  width: 260.0,
                  height: 33.0,
                  child: MaterialButton(
                    color: Colors.blue,

                    onPressed: (){

                    },
                    child: const Text("Register", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    ),

                  ),
                ),

              ],
            ),
          ],
        ),
      ),

    );
  }
}
