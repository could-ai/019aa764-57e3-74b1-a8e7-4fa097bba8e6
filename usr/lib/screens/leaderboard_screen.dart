import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> leaders = [
      {'name': 'الأمير الغني', 'gold': '999,999', 'rank': 1},
      {'name': 'ملكة الدردشة', 'gold': '850,000', 'rank': 2},
      {'name': 'الأسطورة', 'gold': '720,000', 'rank': 3},
      {'name': 'صائد الجوائز', 'gold': '500,000', 'rank': 4},
      {'name': 'الملك الذهبي', 'gold': '50,000', 'rank': 5}, // Current User
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('لوحة المتصدرين'),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: leaders.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          final user = leaders[index];
          final isTop3 = index < 3;
          
          return Card(
            elevation: isTop3 ? 6 : 2,
            color: index == 4 ? Colors.amber.shade50 : Colors.white, // Highlight current user
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: isTop3 ? Colors.amber : Colors.grey.shade300,
                child: Text(
                  '#${user['rank']}',
                  style: TextStyle(
                    color: isTop3 ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                user['name'],
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    user['gold'],
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.amber, fontSize: 16),
                  ),
                  const SizedBox(width: 5),
                  const Icon(Icons.monetization_on, color: Colors.amber, size: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
