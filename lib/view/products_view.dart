import 'package:cart_bloc/bloc/favorites/favorites_cubit.dart';
import 'package:cart_bloc/model/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product/product_bloc.dart';
import './product_detail_view.dart';

class ProductsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
        actions: [
          GestureDetector(
            child: Icon(Icons.favorite),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: Icon(Icons.shopping_cart),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is LoadingProductState)
            return Center(
              child: CircularProgressIndicator(),
            );
          else if (state is LoadedProductState) {
            return _productsGrid(state.items);
          } else if (state is FailedProductState) {
            return Center(
              child: Text('Error: ${state.exception.toString()}'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _productsGrid(List<Item> items) {
    return GridView.builder(
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        Item item = items[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetailsView(item: item)));
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 400,
            decoration: BoxDecoration(
              //color: Colors.red,
              border: Border.all(
                width: 0.5,
                color: Colors.grey,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 200,
                  child: Image.network(
                    item.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        item.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    BlocBuilder<FavoritesCubit, FavoritesState>(
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
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '\$ ${item.price}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
