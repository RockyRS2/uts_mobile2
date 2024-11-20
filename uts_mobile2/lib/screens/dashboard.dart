import 'package:flutter/material.dart';
import 'package:uts_mobile2/screens/buy_car.dart';
import 'package:uts_mobile2/screens/category.dart';
import 'package:uts_mobile2/screens/main_screen.dart';

class DashboardPage extends StatefulWidget {
  final String username;

  const DashboardPage({super.key, required this.username});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CategoryPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BuyPage()),
        );
        break;
    }
  }

  final List<String> carNames = [
    'Toyota Camry',
    'Honda Civic',
    'Ford Mustang',
    'Chevrolet Camaro',
    'BMW Series 3',
    'Nissan GT-R',
    'Tesla Model S',
    'Bentley Continental',
  ];

  final List<String> carImages = [
    'https://imgcdn.oto.com/large/gallery/exterior/38/334/toyota-camry-front-angle-low-view-461058.jpg',
    'https://imgcdn.oto.com/large/gallery/exterior/14/1631/honda-civic-hatchback-front-angle-low-view-929775.jpg',
    'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgdYbxi7CQvfb1nPSYd3tZe1HeitdgQEet6-SoKEnMj5VnwMgr0CFYqNOhkik5UztJeOVMvsgtJlfDxGJigl7aS1O73X_0Mpwm75TC4sJLQLS9t_Fr3Z0yu7TmXHlaRsmIYLUYYNa7EnFLDEF9HrjZdaya_FKgZJnrFzgQcZows37SiBSV3DaT8FR83e56D/s1024/daya-tarik-abadi-ford-mustang-shelby.jpg',
    'https://awsimages.detik.net.id/content/2015/11/03/1211/camaro.jpg',
    'https://imgcdn.oto.com/large/gallery/exterior/3/2195/bmw-3-series-sedan-front-angle-low-view-469306.jpg',
    'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcS68zqw0ceRxN8K0ebBVX1ZfuEFYC3OftI3U9gdxHe0bKDOl8bnIxFr-YTRI7RE',
    'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcReYPONyZaTv0MLjptQ-riHfj_9brsTT2bTDO8-0ARqsKiyJn2wuSjfY-5gWcCx',
    'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcShI0CsGlaMEbdtsqXByQcPSaFiMK3R3a59G4p6RhF696_CVDAEvACxL88mzixG',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard',  style: TextStyle(color: Colors.white),),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 0.8,
          ),
          itemCount: carNames.length,
          itemBuilder: (context, index) {
            return Card(
              color: const Color.fromARGB(255, 107, 140, 198),
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      carImages[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    carNames[index],
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                   'Rp: xxxxxx',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
