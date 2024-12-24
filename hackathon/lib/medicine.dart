import 'package:flutter/material.dart';

class MedicinePage extends StatefulWidget {
  @override
  _MedicinePageState createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  final List<Map<String, dynamic>> medicines = [
    {
      'image': 'assets/paracetamol.jpg',
      'name': 'Paracetamol 500mg',
      'description': 'Relief for fever and mild pain.',
      'basePrice': 50.0,
      'quantity': 1, // Default quantity
      'dosageOptions': {
        '1 Month': 60,
        '3 Months': 180,
        '6 Months': 360,
        '1 Year': 720,
      },
    },
    {
      'image': 'assets/cough.jpg',
      'name': 'Cough Syrup',
      'description': 'Effective for dry and wet cough.',
      'basePrice': 120.0,
      'quantity': 1, // Default quantity
      'dosageOptions': {
        '1 Month': 1,
        '3 Months': 3,
        '6 Months': 6,
        '1 Year': 12,
      },
    },
    {
      'image': 'assets/vitd.jpg',
      'name': 'Vitamin D Capsules',
      'description': 'Boosts immunity and bone health.',
      'basePrice': 300.0,
      'quantity': 1, // Default quantity
      'dosageOptions': {
        '1 Month': 30,
        '3 Months': 90,
        '6 Months': 180,
        '1 Year': 365,
      },
    },
    {
      'image': 'assets/antibiotic.jpg',
      'name': 'Antibiotic Cream',
      'description': 'For minor cuts and wounds.',
      'basePrice': 85.0,
      'quantity': 1, // Default quantity
      'dosageOptions': {
        '1 Month': 1,
        '3 Months': 3,
        '6 Months': 6,
        '1 Year': 12,
      },
    },
    {
      'image': 'assets/spray.jpg',
      'name': 'Pain Relief Spray',
      'description': 'Instant relief from muscle pain.',
      'basePrice': 150.0,
      'quantity': 1, // Default quantity
      'dosageOptions': {
        '1 Month': 1,
        '3 Months': 3,
        '6 Months': 6,
        '1 Year': 12,
      },
    },
  ];

  // Changed cart to a Map
  final Map<String, Map<String, dynamic>> cart = {};

  String selectedDosage = '1 Month';

  void addToCart(Map<String, dynamic> medicine, int quantity) {
    setState(() {
      cart[medicine['name']] = {
        ...medicine,
        'dosage': selectedDosage,
        'quantity': quantity,
        'calculatedPrice': medicine['basePrice'] * quantity,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicines'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart),
                if (cart.isNotEmpty)
                  Positioned(
                    right: 0,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: Text(
                        '${cart.length}',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cart: cart),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 2.5,
            ),
            itemCount: medicines.length,
            itemBuilder: (context, index) {
              final medicine = medicines[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 3,
                color: Colors.blue[50],
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(8.0),
                        ),
                        child: Image.network(
                          medicine['image']!,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 12.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              medicine['name']!,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[800],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              medicine['description']!,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue[700],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            DropdownButton<String>(
                              value: selectedDosage,
                              onChanged: (value) {
                                setState(() {
                                  selectedDosage = value!;
                                });
                              },
                              items: medicine['dosageOptions']!
                                  .keys
                                  .map<DropdownMenuItem<String>>(
                                      (String dosage) {
                                return DropdownMenuItem<String>(
                                  value: dosage,
                                  child: Text(
                                    '$dosage / ${medicine['dosageOptions'][dosage]} ${medicine['name'] == "Paracetamol 500mg" ? "tablets" : medicine['name'] == "Cough Syrup" ? "bottle" : "tube"}',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                );
                              }).toList(),
                            ),
                            Text(
                              'Price: ₹${(medicine['basePrice'] * medicine['dosageOptions'][selectedDosage]).toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                addToCart(medicine,
                                    medicine['dosageOptions'][selectedDosage]);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 4.0,
                                ),
                              ),
                              child: Text(
                                'Add to Cart',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CartPage extends StatefulWidget {
  final Map<String, Map<String, dynamic>> cart;

  CartPage({required this.cart});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double getTotalAmount() {
    return widget.cart.values
        .fold(0, (total, item) => total + item['calculatedPrice']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.blue,
      ),
      body: widget.cart.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty.',
                style: TextStyle(fontSize: 16, color: Colors.blueGrey),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cart.length,
                    itemBuilder: (context, index) {
                      final item = widget.cart.values.toList()[index];
                      return ListTile(
                        leading: Image.network(item['image']!),
                        title: Text(item['name']!),
                        subtitle: Text(
                            'Dosage: ${item['dosage']} | Quantity: ${item['quantity']} | Price: ₹${item['calculatedPrice'].toStringAsFixed(2)}'),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              widget.cart.remove(item['name']);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Total: ₹${getTotalAmount().toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Order Confirmed'),
                              content: Text('Your order has been placed!'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          backgroundColor: Colors.blue,
                        ),
                        child: Text(
                          'Place Order',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
