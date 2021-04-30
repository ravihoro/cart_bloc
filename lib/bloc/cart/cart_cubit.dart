import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/item.dart';

part './cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit()
      : super(CartState(
            cartItems: [], cartMap: Map<int, int>(), totalPrice: 0.0));

  void incrementItemCount(Item item) {
    Map<int, int> map = state.cartMap;
    map.update(item.id, (value) => map[item.id] + 1);
    state.totalPrice += item.price;
    emit(state.copyWith(cartMap: map, totalPrice: state.totalPrice));
    //emit(CartState(cartMap: map, totalPrice: state.totalPrice));
  }

  void decrementItemCount(Item item) {
    int count = state.cartMap[item.id];
    state.totalPrice -= item.price;
    if (count == 1) {
      state.cartMap.remove(item.id);
      state.cartItems.remove(item);
      emit(state.copyWith(
          cartItems: state.cartItems,
          cartMap: state.cartMap,
          totalPrice: state.totalPrice));
      // emit(CartState(
      //     cartItems: state.cartItems,
      //     cartMap: state.cartMap,
      //     totalPrice: state.totalPrice));
    } else {
      state.cartMap.update(item.id, (value) => state.cartMap[item.id] - 1);
      emit(
          state.copyWith(cartMap: state.cartMap, totalPrice: state.totalPrice));
      //emit(CartState(cartMap: state.cartMap, totalPrice: state.totalPrice));
    }
  }

  void addToCart({Item item}) {
    List<Item> items = state.cartItems;
    state.cartMap.addAll({item.id: 1});
    state.totalPrice += item.price;
    if (!items.contains(item)) {
      items.add(item);
      emit(state.copyWith(
          cartItems: items,
          cartMap: state.cartMap,
          totalPrice: state.totalPrice));
      //emit(CartState(cartItems: items));
    }
  }

  void removeFromCart({Item item}) {
    List<Item> items = state.cartItems;
    state.totalPrice -= state.cartMap[item.id] * item.price;
    state.cartMap.remove(item.id);
    if (items.contains(item)) {
      items.remove(item);
      emit(state.copyWith(cartItems: items, totalPrice: state.totalPrice));
      //emit(CartState(cartItems: items, totalPrice: state.totalPrice));
    }
  }
}
