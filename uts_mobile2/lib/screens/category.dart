import 'package:flutter/material.dart';
import 'package:uts_mobile2/screens/main_screen.dart';
import 'dashboard.dart'; // Pastikan import DashboardPage
import 'buy_car.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPage(username: 'User')), // Ganti 'User' sesuai kebutuhan
        );
        break;
      case 1:
        // Tetap di CategoryPage
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BuyPage()),
        );
        break;
    }
  }

  final List<String> carTypes = [
    'Sedan',
    'SUV',
    'Truck',
    'Convertible',
    'Coupe',
    'Hatchback',
    'Minivan',
    'Pickup',
    'Wagon',
    'Crossover',
  ];

  final List<String> carImages = [
   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk8D8pDm8jLLWl-sekbehl-OZvcFM3UVCCrQ&s',
    'https://i0.wp.com/automart.id/wp-content/uploads/2022/07/rush5.jpg?fit=930%2C620&ssl=1',
 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcHBZjch4IGPTj1SuTm0LZd1rYF4OVEbljSA&s',
 'https://imgcdn.oto.com/large/gallery/exterior/26/1566/mini-convertible-front-angle-low-view-989815.jpg',
    'https://imgcdn.oto.com/medium/gallery/exterior/1/11/audi-tts-coupe-front-angle-low-view-192632.jpg',
 'https://astradigitaldigiroomuat.blob.core.windows.net/storage-uat-001/4_Alasan_Memilih_Mobil_Hatchback.jpg',
    'https://i0.wp.com/automart.id/wp-content/uploads/2022/11/hiace7.jpg?fit=930%2C620&ssl=1',
   'https://awsimages.detik.net.id/community/media/visual/2024/08/02/gran-max-pu_169.png?w=620',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtxj3Y7V6YQG1l9XIePfL0x8QVnjZQUj99PQ&s',
    'https://imgcdn.oto.com/medium/gallery/exterior/38/2304/toyota-corolla-cross-30411.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: const Text('Category',  style: TextStyle(color: Colors.white),),
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
            childAspectRatio: 1,
          ),
          itemCount: carTypes.length,
          itemBuilder: (context, index) {
            return Card(
              color: const Color.fromARGB(255, 107, 140, 198),
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 1.5,
                    child: Image.network(
                      carImages[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    carTypes[index],
                    style: const TextStyle(
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
