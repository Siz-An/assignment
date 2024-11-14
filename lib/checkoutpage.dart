import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pos/loginPage.dart';
import 'navpages/navbar.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  List<Map<String, dynamic>> items = [
    {'name': 'UserAdmin', 'quantity': 2, 'price': 100.0},
    {'name': 'UserAdmin', 'quantity': 2, 'price': 100.0},
    {'name': 'UserAdmin', 'quantity': 2, 'price': 100.0},
  ];

  double get totalPrice {
    return items.fold(0, (sum, item) => sum + (item['quantity'] * item['price']));
  }

  void increaseQuantity(int index) {
    setState(() {
      items[index]['quantity']++;
    });
  }

  void decreaseQuantity(int index) {
    if (items[index]['quantity'] > 1) {
      setState(() {
        items[index]['quantity']--;
      });
    }
  }

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background3.png'), // Replace with your image
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Main Content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40), // Add space at the top
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Iconsax.arrow_left, color: Colors.white),
                        onPressed: () => Get.offAll(Navbar()),
                      ),
                      // Grouping POS and Logout button together
                      Row(
                        children: [
                          Text(
                            'POS',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(width: 10), // Adding space between POS and Logout
                          ElevatedButton.icon(
                            onPressed: () => Get.offAll(LoginPage()),
                            icon: Icon(Iconsax.logout_1, color: Colors.blue),
                            label: Text(
                              'Logout',
                              style: TextStyle(color: Colors.blue),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 70),

                  // White Box for Checkout Content
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300, width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch, // Changed to stretch the widgets horizontally
                        children: [
                          // Header Text
                          Text(
                            'Your Cart - ${items.length} items',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 12),

                          // ListView for Cart Items
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 6,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  padding: EdgeInsets.all(12),
                                  child: Row(
                                    children: [
                                      // Product Image
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          'assets/icon2.png',
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 12),

                                      // Product Name and Quantity Control (in a Column)
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              items[index]['name'],
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),

                                            // Quantity Control Below the Product Name
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () => decreaseQuantity(index),
                                                  child: CircleAvatar(
                                                    radius: 12,
                                                    backgroundColor: Colors.blue,
                                                    child: Icon(
                                                      Icons.remove,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 10), // Space between + and -
                                                Text(
                                                  '${items[index]['quantity']}',
                                                  style: TextStyle(fontSize: 16),
                                                ),
                                                SizedBox(width: 10),
                                                GestureDetector(
                                                  onTap: () => increaseQuantity(index),
                                                  child: CircleAvatar(
                                                    radius: 12,
                                                    backgroundColor: Colors.blue,
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),

                                      // Delete Icon and Price
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () => deleteItem(index),
                                            child: CircleAvatar(
                                              radius: 15,
                                              backgroundColor: Colors.red,
                                              child: Icon(Iconsax.trash, color: Colors.white),
                                            ),
                                          ),
                                          SizedBox(height: 8), // Space between delete and price
                                          Text(
                                            'INR ${items[index]['price'].toStringAsFixed(2)}',
                                            style: TextStyle(color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),

                          SizedBox(height: 20),

                          // Total Price Box
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.purpleAccent),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total -',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  'INR ${totalPrice.toStringAsFixed(2)}',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20),

                          // Checkout Button
                          ElevatedButton(
                            onPressed: () {
                              // Handle checkout
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.shopping_cart_checkout, color: Colors.white),
                                SizedBox(width: 8),
                                Text('Checkout', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
