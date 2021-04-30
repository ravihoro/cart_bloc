part of 'cart_cubit.dart';

class CartState {
  List<Item> cartItems;
  Map<int, int> cartMap;

  double totalPrice;

  CartState({this.cartItems, this.cartMap, this.totalPrice});

  CartState copyWith({
    List<Item> cartItems,
    Map<int, int> cartMap,
    double totalPrice,
  }) {
    return CartState(
      cartItems: cartItems ?? this.cartItems,
      cartMap: cartMap ?? this.cartMap,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
