import 'package:cart_bloc/bloc/favorites/favorites_cubit.dart';
import 'package:cart_bloc/view/product_detail_view.dart';
import 'package:cart_bloc/widgets/cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/item.dart';
import '../bloc/cart/cart_cubit.dart';

class FavoritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        actions: [
          CartIcon(),
        ],
      ),
      body: FavoritesGrid(),
    );
  }
}

class FavoritesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return state.favorites.length == 0
            ? Center(
                child: Text(
                  'No favorites',
                ),
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 3.0,
                  mainAxisSpacing: 3.0,
                ),
                itemCount: state.favorites.length,
                itemBuilder: (context, index) {
                  return customCard(state.favorites[index], context);
                },
              );
      },
    );
  }

  Widget customCard(Item item, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailsView(item: item)));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 35),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(
                          item.imageUrl,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '${item.title}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '\$ ${item.price}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Divider(
                  height: 1.0,
                  thickness: 1.0,
                ),
                SizedBox(height: 5),
                TextButton(
                  onPressed: () {
                    context.read<CartCubit>().addToCart(item: item);

                    context
                        .read<FavoritesCubit>()
                        .removeFromFavorites(item: item);
                  },
                  child: Text(
                    'Move to Cart',
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
            Positioned(
              right: 1.0,
              top: 1.0,
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.deepPurpleAccent,
                ),
                onPressed: () {
                  context
                      .read<FavoritesCubit>()
                      .removeFromFavorites(item: item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
