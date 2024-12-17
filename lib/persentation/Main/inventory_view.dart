import 'package:flutter/material.dart';

import '../widget/expiringItemCard.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('AHSIN',style: TextStyle(color: Colors.green),textAlign: TextAlign.center)),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_active_sharp,color:Colors.green,),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Here',
                filled: true,
                fillColor: Colors.orangeAccent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search,color: Colors.white,),
              ),
            ),
            SizedBox(height: 20),
            // Expiration Info
            Container(
              color: Colors.orangeAccent,
              width: 350,

              child:const Center(
                child: Text(
                  '3 items expiring soon',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                ),
              ) ,
            ),
            SizedBox(height: 20),
            // Expiring Items List
            SizedBox(
              height: 210,
              child: ListView(
                scrollDirection: Axis.horizontal,

                children: const [
                  ExpiringItemCard(
                    title: 'Milk',
                    imageUrl: 'assets/images/milk.jpg',
                    expiryDate: '5 days',
                  ),

                  ExpiringItemCard(
                    title: 'PENNE RIGATE',
                    imageUrl: 'assets/images/penne.jpg',
                    expiryDate: '5 days',
                  ),


                  ExpiringItemCard(
                    title: 'Bread',
                    imageUrl: 'assets/images/bread.jpg',
                    expiryDate: '5 days',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF228B22),

        selectedItemColor: Colors.orange,

        unselectedItemColor: Colors.white.withOpacity(0.5),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add item'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Inventory'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Recipes'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Sitting'),
        ],
      ),
    );
  }



}

void main() {
  runApp(MaterialApp(
    home: InventoryScreen(),
  ));
}