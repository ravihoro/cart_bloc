import 'package:cart_bloc/bloc/favorites/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cart/cart_cubit.dart';
import '../model/item.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return state.cartItems.length == 0
              ? Center(
                  child: Text(
                    'No items in cart.',
                  ),
                )
              : ListView.builder(
                  itemCount: state.cartItems.length,
                  itemBuilder: (context, index) {
                    return customListTile(state.cartItems[index], context);
                  },
                );
        },
      ),
    );
  }

  Widget customListTile(Item item, BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    height: 150,
                    width: 125,
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
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 150,
                      //color: Colors.yellow,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          //Text(item.description),
                          Text(
                            '\$ ${item.price}',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Quantity: ",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  //baseModel.decrementCount(item);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  //color: Colors.red,
                                  height: 30,
                                  width: 30,
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                      color: Colors.deepPurpleAccent,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 10.0,
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "1",
                                    //"${baseModel.cartMap[item.id]}",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  //baseModel.incrementCount(item);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  //color: Colors.red,
                                  height: 30,
                                  width: 30,
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                      color: Colors.deepPurpleAccent,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Text(
                    'Remove'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 18.0,
                    ),
                  ),
                  onTap: () {
                    context.read<CartCubit>().removeFromCart(item: item);
                  },
                ),
                Container(
                  width: 1.0,
                  height: 25.0,
                  color: Colors.grey,
                ),
                InkWell(
                  child: Text(
                    'Move to favorites'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 18.0,
                    ),
                  ),
                  onTap: () {
                    context.read<CartCubit>().removeFromCart(item: item);
                    context.read<FavoritesCubit>().addToFavorites(item: item);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
