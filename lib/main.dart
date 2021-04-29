import 'package:cart_bloc/bloc/favorites/favorites_cubit.dart';
import 'package:cart_bloc/bloc/product/product_bloc.dart';
import 'package:cart_bloc/service/http_service.dart';
import 'package:cart_bloc/view/products_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<ProductBloc>(
            create: (context) => ProductBloc(httpService: HttpService())
              ..add(FetchProductEvent()),
          ),
          BlocProvider(create: (context) => FavoritesCubit()),
        ],
        child: ProductsView(),
      ),
    );
  }
}
