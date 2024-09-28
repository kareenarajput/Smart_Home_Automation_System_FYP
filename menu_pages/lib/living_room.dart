import 'package:flutter/material.dart';

class LivingRoom extends StatefulWidget {
  const LivingRoom({super.key});

  @override
  LivingRoomState createState() => LivingRoomState();
}

class LivingRoomState extends State<LivingRoom> {
  List<Appliance> appliances = [
    const Appliance(
      name: "Lights",
      powerConsumption: 1100,
      isOn: true,
      icon: Icons.lightbulb, // Use built-in icon
      customText: "5",
    ),
    const Appliance(
      name: "Fan",
      powerConsumption: 0,
      isOn: false,
      icon: Icons.mode_fan_off, // Use built-in icon
      customText: "2",
    ),
    const Appliance(
      name: "AC",
      powerConsumption: 0,
      isOn: false,
      icon: Icons.ac_unit,
      customText:"1",
    ),
    const Appliance(
      name: "TV",
      powerConsumption: 0,
      isOn: false,
      icon: Icons.tv, // Use built-in icon
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
        title: const Text("Living Room",style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body:
      Padding(
        padding: const EdgeInsets.all(26.0),
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
