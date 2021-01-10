/// The [dart:async] is neccessary for using streams
import 'dart:async';

class CartItemsBloc {
  /// The [cartStreamController] is an object of the StreamController class
  /// .broadcast enables the stream to be read in multiple screens of our app
  final cartStreamController = StreamController.broadcast();

  /// The [getStream] getter would be used to expose our stream to other classes
  Stream get getStream => cartStreamController.stream;

  final Map allItems = {
    'shop items': [
      //dummy shopping item
      {'name': 'some type of corn', 'price': 20, 'id': 1},
    ],
    'cart items': []
  };



  void addToCart(item) {
    allItems['shop items'].remove(item);
    allItems['cart items'].add(item);
    cartStreamController.sink.add(allItems);
  }

  void removeFromCart(item) {
    allItems['cart items'].remove(item);
    allItems['shop items'].add(item);
    cartStreamController.sink.add(allItems);
  }

  String totalCost() {
    int count = 0;
    for (int k = 0; k< allItems.length; k++) {
      count += allItems[k]['price'];
    }
    return count.toString();
  }//end total cost

  /// The [dispose] method is used
  /// to automatically close the stream when the widget is removed from the widget tree
  void dispose() {
    cartStreamController.close(); // close our StreamController
  }
}

final bloc = CartItemsBloc();
