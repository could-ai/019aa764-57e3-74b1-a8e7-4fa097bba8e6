import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ChatRoomsList(),
    ShopScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('لعبة الدردشة'),
        actions: [
          // Placeholder for Gold/Currency
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: const [
                Icon(Icons.monetization_on, color: Colors.amber),
                SizedBox(width: 4),
                Text('1,000', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'الغرف',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'المتجر',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'الملف الشخصي',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ChatRoomsList extends StatelessWidget {
  const ChatRoomsList({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for chat rooms
    final List<String> rooms = ['غرفة الأصدقاء', 'ديوانية الشباب', 'مقهى البنات', 'عشاق الألعاب', 'محبي الأفلام'];

    return ListView.builder(
      itemCount: rooms.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ListTile(
            leading: const Icon(Icons.group, color: Colors.teal),
            title: Text(rooms[index]),
            subtitle: Text('انضم إلى المحادثة الآن!'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/chat_room', arguments: rooms[index]);
            },
          ),
        );
      },
    );
  }
}

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'المتجر - قريباً!',
        style: TextStyle(fontSize: 24, color: Colors.grey),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'الملف الشخصي - قريباً!',
        style: TextStyle(fontSize: 24, color: Colors.grey),
      ),
    );
  }
}
