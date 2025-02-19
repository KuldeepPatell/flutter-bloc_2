import 'package:bloc_state_by_akshit_madan/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_state_by_akshit_madan/features/cart/ui/cart_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Cart")),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {
          if (state is CartRemoveFromCartAction) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Item removed from cart")));
          } else if (state is CartProductAddToWishlistAction) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Item added to wishlist")));
          }
        },
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                  itemCount: successState.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartTileWidget(
                        cartBloc: cartBloc,
                        productDataModel: successState.cartItems[index]);
                  });
            default:
          }
          return Container();
        },
      ),
    );
  }
}
