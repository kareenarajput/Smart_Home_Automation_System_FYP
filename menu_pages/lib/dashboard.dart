import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:menu_pages/PrivacyPolicy.dart';
import 'package:menu_pages/Rooms/Bedroom.dart';
import 'package:menu_pages/Rooms/KidsRoom.dart';
import 'package:menu_pages/Rooms/Kitchen.dart';
import 'package:menu_pages/Rooms/LineGraphChart.dart';
import 'package:menu_pages/Rooms/WashingArea.dart';
import 'package:menu_pages/Rooms/Washroom.dart';
import 'package:menu_pages/Rooms/AddRoom.dart';
import 'package:menu_pages/aboutus.dart';
import 'package:menu_pages/contactus.dart';
import 'package:menu_pages/living_room.dart';
import 'package:menu_pages/profile.dart';
import 'package:menu_pages/terms_conditions.dart';
import 'package:menu_pages/services/local_storage_service.dart';
import 'config.dart';
import 'dart:convert';
import 'package:http/http.dart' as http; // Corrected import statement

// Navigator Observer to listen for navigation events
class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    if (previousRoute?.settings.name == '/') {
      // Notify the Dashboard widget when returning
      (route.settings.arguments as _DashboardState?)?.onReturnToScreen();
    }
  }
}

class Dashboard extends StatefulWidget {
  final String token;

  const Dashboard({required this.token, Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? email;
  String? firstName;
  String? lastName;
  List<dynamic> rooms = [];
  bool _isLoading = true;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchUserInfo();
    _fetchRooms();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchRooms();
  }

  void onReturnToScreen() {
    _fetchRooms();
  }

  IconData _getIconData(String iconString) {
    if (RegExp(r'^[0-9a-fA-F]{1,5}$').hasMatch(iconString)) {
      int codePoint = int.parse(iconString, radix: 16);
      return IconData(codePoint, fontFamily: 'MaterialIcons');
    } else {
      return Icons.home;
    }
  }

  Future<void> _fetchRooms() async {
    try {
      final response = await http.get(
        Uri.parse(getRoom),
        headers: {
          'Authorization': 'Bearer ${widget.token}',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          final data = json.decode(response.body);
          rooms = data['rooms'];
          print(rooms);
        });
      } else {
        throw Exception('Failed to load rooms');
      }
    } catch (e) {
      // Handle error (e.g., show a Snackbar, log error)
      print(e);
    }
  }

  Future<void> _fetchUserInfo() async {
    setState(() {
      _isLoading = true;
    });

    final userInfo = await LocalStorageService.getUserInfo();

    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
    email = userInfo['email'] ?? jwtDecodedToken['email'] ?? 'user@example.com'; // Default email
    firstName = userInfo['firstName'] ?? jwtDecodedToken['firstName'] ?? 'User'; // Default first name
    lastName = userInfo['lastName'] ?? jwtDecodedToken['lastName'] ?? ''; // Default last name

    setState(() {
      _isLoading = false;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 1:
        return LineGraphChart();
      case 2:
        return const UserProfile();
      default:
        return _buildDashboardContent();
    }
  }

  Widget _buildDashboardContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Text(
            'Rooms',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black87),
            textAlign: TextAlign.left,
          ),
        ),
        Expanded(
          child: GridView.count(
            padding: const EdgeInsets.all(15),
            crossAxisCount: 2,
            children: List.generate(rooms.length, (index) {
              final room = rooms[index];
              return _buildRoomCard(
                room['roomName'],        // Use the room name from API
                _getIconData(room['roomIcon']),
                // Icons.home,              // Replace with appropriate room icon
                Colors.blue,             // Replace with appropriate color if needed
                '0 Devices',             // Placeholder for devices, adjust if needed
                    () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => _getRoomPage(index)));
                },
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _getRoomPage(int index) {
    // Map the index to the correct room page
    switch (index) {
      case 0: return const LivingRoom();
      case 1: return const KidsRoom();
      case 2: return const Kitchen();
      case 3: return const Bedroom();
      case 4: return const WashingArea();
      case 5: return const Washroom();
      default: return const SizedBox(); // Default empty widget
    }
  }

  List<BottomNavigationBarItem> _buildNavigationItems() {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.dashboard),
        label: 'Dashboard',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.auto_graph),
        label: 'Graphs',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Smart Home Automation System',
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
      drawer: Drawer(
        backgroundColor: Colors.white,
        width: 300.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('$firstName $lastName' ?? 'Loading...'),
              accountEmail: Text(email ?? 'Loading...'),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: Colors.blue),
              ),
              decoration: BoxDecoration(
                color: Colors.blue[800],
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.lightBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            const Divider(color: Colors.grey),
            ListTile(
              leading: const Icon(Icons.privacy_tip, color: Colors.blue),
              title: const Text('Privacy Policy', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacyPolicyPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.blue),
              title: const Text('Contact Us', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const contactus()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.blue),
              title: const Text('About Us', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutUs()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.task_rounded, color: Colors.blue),
              title: const Text('Terms & Conditions', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TermsAndConditions()));
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: _buildBody(),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddRoom()),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.lightBlue,
      )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        items: _buildNavigationItems(),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.lightBlue,
      ),
    );
  }

  Widget _buildRoomCard(String title, IconData icon, Color color, String deviceCount, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.1), // Adjust transparency if needed
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 40, color: color),
                const SizedBox(height: 10),
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(deviceCount, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
