// import 'package:flutter/material.dart';
// import '../view/favorites_view.dart';
// import '../view/cart_view.dart';
// import 'package:cart_bloc/bloc/cart/cart_cubit.dart';
// import 'package:cart_bloc/view/cart_view.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AppbarIcons extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         GestureDetector(
//           child: Icon(Icons.favorite),
//           onTap: () {
//             Navigator.of(context)
//                 .push(MaterialPageRoute(builder: (context) => FavoritesView()));
//           },
//         ),
//         SizedBox(
//           width: 15,
//         ),
//         _cartIcon(context),
//         SizedBox(
//           width: 15,
//         ),
//       ],
//     );
//   }

//   Widget _cartIcon(BuildContext context) {
//     return Stack(
//       children: [
//         InkWell(
//           child: Container(
//             margin: const EdgeInsets.only(top: 3.5),
//             height: 50,
//             width: 50,
//             child: Icon(Icons.shopping_cart),
//           ),
//           onTap: () {
//             Navigator.of(context)
//                 .push(MaterialPageRoute(builder: (context) => CartView()));
//           },
//         ),
//         Positioned(
//           right: 8,
//           top: 7,
//           child: BlocBuilder<CartCubit, CartState>(
//             builder: (context, state) {
//               return state.cartItems.length == 0
//                   ? Container()
//                   : Container(
//                       alignment: Alignment.center,
//                       height: 20,
//                       width: 20,
//                       child: Text("${state.cartItems.length}"),
//                       decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
