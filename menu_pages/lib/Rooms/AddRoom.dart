import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config.dart';
import 'package:menu_pages/services/local_storage_service.dart'; // Import the local storage service

class AddRoom extends StatefulWidget {
  const AddRoom({super.key});

  @override
  _AddRoomState createState() => _AddRoomState();
}

class _AddRoomState extends State<AddRoom> {
  final TextEditingController _roomNameController = TextEditingController();
  final List<IconData> roomIcons = [
    Icons.bed,
    Icons.kitchen,
    Icons.tv,
    Icons.bathtub,
    Icons.chair,
    Icons.door_front_door,
    Icons.lightbulb_outline,
    Icons.ac_unit,
    Icons.child_care,
    Icons.local_laundry_service,
    Icons.work,
    Icons.pets,
    Icons.storage,
    Icons.room_preferences,
  ];

  IconData? selectedIcon;
  String? token;

  @override
  void initState() {
    super.initState();
    _loadToken(); // Load the token from local storage
  }

  Future<void> _loadToken() async {
    token = await LocalStorageService.getToken(); // Fetch token from local storage
  }

  String _iconDataToHex(IconData icon) {
    return icon.codePoint.toRadixString(16).toUpperCase(); // Convert to hex and make it uppercase
  }

  Future<void> _addRoom() async {
    if (_roomNameController.text.isNotEmpty && selectedIcon != null && token != null) {
      final roomName = _roomNameController.text;
      final roomIcon = _iconDataToHex(selectedIcon!);

      final Map<String, dynamic> data = {
        'roomName': roomName,
        'roomIcon': roomIcon,
      };

      try {
        final response = await http.post(
          Uri.parse(addRoom),
          headers: {
            'Authorization': 'Bearer $token', // Use the loaded token
            'Content-Type': 'application/json',
          },
          body: json.encode(data),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          // Room added successfully
          Navigator.pop(context); // Navigate back to the dashboard
        } else {
          // Handle errors based on status code
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${response.body}')),
          );
        }
      } catch (e) {
        // Handle network or other errors
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to add room. Please try again.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a room name and select an icon.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Add Room',
          style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        elevation: 4.0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.lightBlue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _roomNameController,
                decoration: InputDecoration(
                  labelText: 'Room Name',
                  labelStyle: TextStyle(color: Colors.grey[800]),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Select Room Icon',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 12.0,
                alignment: WrapAlignment.start,
                children: roomIcons.map((icon) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIcon = icon;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        icon,
                        size: 40,
                        color: selectedIcon == icon ? Colors.blueAccent : Colors.grey,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: _addRoom,
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text('Add Room', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
