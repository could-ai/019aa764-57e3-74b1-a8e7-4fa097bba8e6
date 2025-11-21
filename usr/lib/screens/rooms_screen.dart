import 'package:flutter/material.dart';
import 'chat_screen.dart';

class RoomsScreen extends StatelessWidget {
  const RoomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> rooms = [
      {'name': 'غرفة المبتدئين', 'color': Colors.blue.shade100, 'icon': Icons.star_border},
      {'name': 'غرفة الذهب', 'color': Colors.amber.shade100, 'icon': Icons.monetization_on},
      {'name': 'كبار الشخصيات', 'color': Colors.purple.shade100, 'icon': Icons.diamond},
      {'name': 'الدردشة العامة', 'color': Colors.green.shade100, 'icon': Icons.public},
      {'name': 'الألعاب والمسابقات', 'color': Colors.red.shade100, 'icon': Icons.games},
      {'name': 'الموسيقى والفن', 'color': Colors.pink.shade100, 'icon': Icons.music_note},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('غرف الدردشة'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.1,
          ),
          itemCount: rooms.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(roomName: rooms[index]['name']),
                  ),
                );
              },
              child: Card(
                color: rooms[index]['color'],
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(rooms[index]['icon'], size: 40, color: Colors.black54),
                    const SizedBox(height: 10),
                    Text(
                      rooms[index]['name'],
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
