import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../model/item.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesState(favorites: []));

  void addToFavorites({Item item}) {
    List<Item> items = state.favorites;
    if (!items.contains(item)) {
      items.add(item);
      emit(FavoritesState(favorites: items));
    }
  }

  void removeFromFavorites({Item item}) {
    List<Item> items = state.favorites;
    if (items.contains(item)) {
      items.remove(item);
      emit(FavoritesState(favorites: items));
    }
  }
}
