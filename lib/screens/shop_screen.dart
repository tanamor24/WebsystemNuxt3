import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/bottom_nav.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 70, 58),
        foregroundColor: const Color.fromARGB(255, 243, 63, 72),
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: SizedBox(
            height: 45,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Products...',
                filled: true,
                fillColor: Colors.red,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        actions: const [
          Icon(Icons.shopping_cart),
          SizedBox(width: 8),
          Icon(Icons.message),
          SizedBox(width: 12),
        ],
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/images/ww.png",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Bag",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Text("₱1500.00"),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => BottomNav()),
                      );
                    },
                    child: const Text("Add to Cart"),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
