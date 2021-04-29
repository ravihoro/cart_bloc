import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../model/item.dart';

part './cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(cartItems: []));

  void addToCart({Item item}) {
    List<Item> items = state.cartItems;
    items.add(item);
    emit(CartState(cartItems: items));
  }

  void removeFromCart({Item item}) {
    List<Item> items = state.cartItems;
    items.remove(item);
    emit(CartState(cartItems: items));
  }
}
