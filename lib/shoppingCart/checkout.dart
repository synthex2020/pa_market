/*  This class is to show the items in the shopping cart you are about to buy

 */

import 'package:flutter/material.dart';
import 'package:pa_market/shoppingCart/bloc.dart';
class Checkout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        initialData: bloc.allItems,
        stream: bloc.getStream,
        builder: (context , snapshot) {
          return snapshot.data["cart items"].length > 0 ? Column(
            children: [
              Expanded(child: checkOutList(snapshot),),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: Text("Total product cost: ")),
                        Expanded(child: Text("\$$total"),)
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Text("Delivery fee: "),),
                        Expanded(child: Text("\$5.00"),)
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Text("Taxes and final total: "),),
                        Expanded(child: Text("\$${calculateTax()}"),)
                      ],
                    )
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("checkout"),
              )
            ],
          ): Center(child: Text("All items have been checkout already"),);
        },
      ),
    );
  }

  String calculateTax() {
    double tax = 0.13;
    int total =  50;
    double addedTax = total * tax;
    return (addedTax + total).toString();
  }
}

int total = 0;

Widget checkOutList (snapshot) {
  total = 0;
  return ListView.builder(
    itemCount: snapshot.data["cart items"].length,
    itemBuilder: (BuildContext context , int index) {
      final cartList =  snapshot.data["cart items"];
      total += cartList[index]['price'];
      print("The total: $total");
      return ListTile(
        title: Text(cartList[index]['name']),
        subtitle: Text("\$${cartList[index]['price']}"),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle),
          onPressed: () {
            bloc.removeFromCart(cartList[index]);
          },
        ),
      );
    },
  );
}//end list