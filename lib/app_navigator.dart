// import 'package:cart_bloc/bloc/product_detail/product_detail_cubit.dart';
// import 'package:cart_bloc/view/product_detail_view.dart';
// import 'package:cart_bloc/view/products_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'model/item.dart';

// class AppNavigator extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ProductDetailCubit, Item>(
//       builder: (context, state) {
//         return Navigator(
//           pages: [
//             MaterialPage(
//               child: ProductsView(),
//             ),
//             if (state != null)
//               MaterialPage(
//                 child: ProductDetailsView(),
//               ),
//           ],
//           onPopPage: (route, result) {
//             context.read<ProductDetailCubit>().clearProductDetail();
//             return route.didPop(result);
//           },
//         );
//       },
//     );
//   }
// }
