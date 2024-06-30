import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_app/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey[800]),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'My Cart',
                  style: GoogleFonts.notoSerif(
                      fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.cartItems.length,
                  padding: EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: Image.asset(value.cartItems[index][2]),
                          title: Text(value.cartItems[index][0]),
                          subtitle: Text('\$' + value.cartItems[index][1],
                              style: TextStyle(fontSize: 12)),
                          trailing: IconButton(
                            icon: Icon(Icons.cancel),
                            onPressed: () =>
                                Provider.of<CartModel>(context, listen: false)
                                    .removeItemFromCart(index),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green,
                  ),
                  padding: EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total Price",
                              style: TextStyle(color: Colors.green[200])),
                          SizedBox(height: 8),
                          Text(
                            '\$${value.totalPrice}',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green.shade200),
                            borderRadius: BorderRadius.circular(28)),
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Text(
                              'Pay Noe',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
