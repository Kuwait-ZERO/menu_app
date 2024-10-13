import 'package:flutter/material.dart';
import 'package:menu_app/models/food.dart';

void main() {
  runApp(const MenuApp());
}

class MenuApp extends StatelessWidget {
  const MenuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // List of Food items
  final List<Food> menuItems = [
    Food(name: 'Pasta', imgPath: 'assets/images/pasta.jpg'),
    Food(name: 'Burger', imgPath: 'assets/images/burger.jpg'),
    Food(name: 'Suchi', imgPath: 'assets/images/suchi.jpg'),
    Food(name: 'Pizza', imgPath: 'assets/images/pizza.jpg'),
    Food(name: 'Biryani', imgPath: 'assets/images/biryani.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu App'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      // GridView.builder
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // Number of columns
          childAspectRatio: 3 / 2, // Width to height ratio of each grid tile
          crossAxisSpacing: 10, // Horizontal space between tiles
          mainAxisSpacing: 10, // Vertical space between tiles
        ),
        itemCount: menuItems.length, // Number of items in the grid
        itemBuilder: (context, index) {
          final foodItem = menuItems[index]; // Access each food item

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    foodItem.imgPath,
                    width: double.infinity, // Take the full width of the card
                    height: 120,
                    fit: BoxFit.contain, // to make sure the whole image is shown
                  ),
                  const SizedBox(height: 10),
                  Text(
                    foodItem.name,
                    style:  TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
