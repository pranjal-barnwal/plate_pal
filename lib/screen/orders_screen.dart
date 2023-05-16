import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //:?    Making StatusBar Transparent
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),

        //:: Text with Icon
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(Icons.shopping_cart),
            ),
            const Text(
              "Orders",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),

      body: Container(
        child: const Center(
          child: Text(
            'Orders Screen',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
