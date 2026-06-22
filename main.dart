import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BootCamp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 43, 243, 2),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

//////////////// MAIN SCREEN //////////////////
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    ProfilePage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAddPressed() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Plus button clicked ➕")),
    );
  }

  void _openPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // close drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // 🟡 APP BAR
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          "Flutter App",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      // 📂 DRAWER MENU
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [

            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.yellow),
              child: Text(
                "Menu",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () => _openPage(0),
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () => _openPage(1),
            ),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () => _openPage(2),
            ),
          ],
        ),
      ),

      // 📌 BODY
      body: _pages[_selectedIndex],

      // 🔽 BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),

      // ➕ FLOATING BUTTON
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: _onAddPressed,
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}

//////////////// HOME PAGE (FORM UI) //////////////////
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  void _submit() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Saved: ${nameController.text} | ${addressController.text}",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            const SizedBox(height: 20),

            // 👤 PROFILE ICON
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),

            const SizedBox(height: 20),

            // NAME
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // ADDRESS
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: "Address",
                prefixIcon: const Icon(Icons.home),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // SUBMIT
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
                onPressed: _submit,
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//////////////// PROFILE //////////////////
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Profile Page"));
  }
}

//////////////// SETTINGS //////////////////
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Settings Page"));
  }
}
