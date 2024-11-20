import 'package:flutter/material.dart';
import 'package:uts_mobile2/screens/main_screen.dart';
import 'dashboard.dart'; // Pastikan import DashboardPage
import 'category.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardPage(username: 'User'),
          ),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const CategoryPage()),
        );
        break;
      case 2:
        break;
    }
  }

  final List<String> carNames = [
    'Toyota Camry',
    'Honda Civic',
    'Ford Mustang',
   
  ];

  final List<String> carImages = [
    'https://imgcdn.oto.com/large/gallery/exterior/38/334/toyota-camry-front-angle-low-view-461058.jpg',
    'https://imgcdn.oto.com/large/gallery/exterior/14/1631/honda-civic-hatchback-front-angle-low-view-929775.jpg',
    'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgdYbxi7CQvfb1nPSYd3tZe1HeitdgQEet6-SoKEnMj5VnwMgr0CFYqNOhkik5UztJeOVMvsgtJlfDxGJigl7aS1O73X_0Mpwm75TC4sJLQLS9t_Fr3Z0yu7TmXHlaRsmIYLUYYNa7EnFLDEF9HrjZdaya_FKgZJnrFzgQcZows37SiBSV3DaT8FR83e56D/s1024/daya-tarik-abadi-ford-mustang-shelby.jpg',
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Buy Car',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              if (value == 'logout') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                );
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Buy',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: carNames.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    carImages[index],
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          carNames[index],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Rp - xxxxxxx',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const ElevatedButton(
                          onPressed: null, 
                          child: Text('Checkout',  style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
