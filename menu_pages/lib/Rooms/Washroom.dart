import 'package:flutter/material.dart';

class Washroom extends StatefulWidget {
  const Washroom({super.key});

  @override
  WashroomState createState() => WashroomState();
}

class WashroomState extends State<Washroom> {
  List<Appliance> appliances = [
    const Appliance(
      name: "Lights",
      powerConsumption: 1100,
      isOn: true,
      icon: Icons.lightbulb,
      customText: "2",
    ),
    const Appliance(
      name: "Exhaust Fan",
      powerConsumption: 1100,
      isOn: true,
      icon: Icons.air,
      customText: "1",
    ),


    // ... Add other appliances
  ];

  void toggleAppliance(int index) {
    setState(() {
      appliances[index] = appliances[index].copyWith(isOn: !appliances[index].isOn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("  Washroom",style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: appliances.map((appliance) {
            return ApplianceCard(
              appliance: appliance,
              isOn: appliance.isOn, // Pass current state
              onTap: () => toggleAppliance(appliances.indexOf(appliance)), // Direct toggle
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Appliance {
  final String name;
  final int powerConsumption;
  final bool isOn;
  final IconData icon;
  final String customText;

  const Appliance({
    required this.name,
    required this.powerConsumption,
    required this.isOn,
    required this.icon,
    required this.customText,
  });

  Appliance copyWith({bool? isOn}) {
    return Appliance(
      name: this.name,
      powerConsumption: this.powerConsumption,
      isOn: isOn ?? this.isOn,
      icon: this.icon,
      customText: this.customText,
    );
  }
}

class ApplianceCard extends StatelessWidget {
  final Appliance appliance;
  final bool isOn; // Receive current state
  final Function() onTap; // Simplified callback

  const ApplianceCard({
    super.key,
    required this.appliance,
    required this.isOn,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell( // Use InkWell for tap detection
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              appliance.icon,
              size: 40, // Adjust size as needed
            ),
            Text(appliance.name),
            Text(
              appliance.customText,
              style: TextStyle(
                fontSize: 12,
                color: appliance.isOn ? Colors.green : Colors.red,
              ),
            ),
            Switch( // Add the Switch widget here
              value: isOn, // Use the passed `isOn` state
              onChanged: (value) => onTap(), // Trigger toggle on change
            ),
          ],
        ),
      ),
    );
  }
}
