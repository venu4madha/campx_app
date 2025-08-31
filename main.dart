import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CampX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const PlaceholderPage(title: 'Assignments'),
    const PlaceholderPage(title: 'Library'),
    const PlaceholderPage(title: 'Messages'),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _openSchedule(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SchedulePage()),
    );
  }

  Widget _buildSmallCard({
    required Color color,
    required IconData icon,
    required String title,
    String? subtitle,
    String? updated,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: Colors.black54),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(fontSize: 12)),
          ],
          if (updated != null) ...[
            const SizedBox(height: 4),
            Text(
              updated,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        title: const CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(
            'assets/logo.png',
          ), // Replace with your logo
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile & Schedule card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hi Mada Venumadhav,",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text("Good Afternoon, Wednesday, 27 August"),
                  const SizedBox(height: 8),
                  const Text(
                    "25.2°C • Showers",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const Divider(height: 20),
                  GestureDetector(
                    onTap: () => _openSchedule(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "View Schedule",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              "ESSENTIALS",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.3, // Makes cards smaller
              children: [
                _buildSmallCard(
                  color: Colors.green.shade100,
                  icon: Icons.calendar_today,
                  title: "Attendance",
                  subtitle: "67.76%",
                  updated: "As on Aug 26, 16:00 PM",
                ),
                _buildSmallCard(
                  color: Colors.red.shade100,
                  icon: Icons.account_balance_wallet,
                  title: "Fee Payments",
                  subtitle: "INR 2,500.00",
                  updated: "As on Aug 24, 00:41 AM",
                ),
                _buildSmallCard(
                  color: Colors.purple.shade100,
                  icon: Icons.event,
                  title: "Campus Events",
                ),
                _buildSmallCard(
                  color: Colors.blue.shade100,
                  icon: Icons.group,
                  title: "Campus Clubs",
                ),
              ],
            ),

            const SizedBox(height: 20),
            const Text(
              "TOOLS",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildSmallCard(
              color: Colors.pink.shade100,
              icon: Icons.feedback,
              title: "Feedbacks",
            ),
          ],
        ),
      ),
    );
  }
}

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final schedule = [
      {"time": "9:00 AM", "subject": "Mathematics"},
      {"time": "10:00 AM", "subject": "Physics"},
      {"time": "11:00 AM", "subject": "Chemistry"},
      {"time": "1:00 PM", "subject": "Computer Science"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Schedule')),
      body: ListView.builder(
        itemCount: schedule.length,
        itemBuilder: (context, index) {
          final item = schedule[index];
          return ListTile(
            leading: const Icon(Icons.schedule),
            title: Text(item["subject"]!),
            subtitle: Text(item["time"]!),
          );
        },
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Name: M. Venumadhav",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("Roll Number: 23D41A05D2", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Branch: CSE-C", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Email: venumadha6@gmail.com", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Date of Birth: 17/03/2004", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String title;
  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          "$title Page",
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
