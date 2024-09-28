import 'package:flutter/material.dart';

class RoutinesPage extends StatelessWidget {
  const RoutinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routines',style: TextStyle(color: Colors.white)),

        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/create-routine'),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: routines.length, // Replace with actual routine data
        itemBuilder: (context, index) {
          final routine = routines[index];
          return RoutineCard(routine: routine);
        },
      ),
    );
  }
}

class RoutineCard extends StatelessWidget {
  final Routine routine;

  const RoutineCard({Key? key, required this.routine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    routine.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4.0),
                  Text(routine.triggerSchedule),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

// Sample routine data (replace with actual data fetching)
List<Routine> routines = [
  Routine(
    name: 'Morning Wake Up',
    triggerSchedule: 'Weekday mornings at 7:00 AM',
    isActive: true,
  ),
  Routine(
    name: 'Evening Relax',
    triggerSchedule: 'Every night at 9:00 PM',
    isActive: false,
  ),
];

// Define a class to represent a routine (optional for future enhancements)
class Routine {
  final String name;
  final String triggerSchedule;
  final bool isActive;

  Routine({
    required this.name,
    required this.triggerSchedule,
    required this.isActive,
  });
}
