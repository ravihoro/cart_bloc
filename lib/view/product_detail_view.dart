import 'package:cart_bloc/model/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/favorites/favorites_cubit.dart';
import '../bloc/cart/cart_cubit.dart';
import 'cart_view.dart';

class ProductDetailsView extends StatelessWidget {
  final Item item;

  ProductDetailsView({@required this.item});

  @override
  Widget build(BuildContext context) {
    List<Item> cartItems = context.watch<CartCubit>().state.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Detail',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 350),
              child: BlocBuilder<FavoritesCubit, FavoritesState>(
                  builder: (context, state) {
                return state.favorites.contains(item)
                    ? GestureDetector(
                        onTap: () {
                          context
                              .read<FavoritesCubit>()
                              .removeFromFavorites(item: item);
                        },
                        child: Icon(Icons.favorite))
                    : GestureDetector(
                        onTap: () {
                          context
                              .read<FavoritesCubit>()
                              .addToFavorites(item: item);
                        },
                        child: Icon(
                          Icons.favorite_border_outlined,
                        ),
                      );
              }),
            ),
            SizedBox(height: 5),
            Card(
              elevation: 10.0,
              child: Hero(
                tag: item.id,
                child: Container(
                  padding: const EdgeInsets.all(18.0),
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    //color: Colors.red,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(
                        item.imageUrl,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              item.title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 15),
            Text(
              item.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Price: \$${item.price}',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.deepPurpleAccent,
              ),
            ),
            SizedBox(height: 15),
            cartItems.contains(item)
                ? ElevatedButton(
                    child: Text(
                      'Go to Cart',
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => CartView()));
                    },
                  )
                : ElevatedButton(
                    child: Text(
                      'Add to Cart',
                    ),
                    onPressed: () {
                      context.read<CartCubit>().addToCart(item: item);

                      context
                          .read<FavoritesCubit>()
                          .removeFromFavorites(item: item);
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
