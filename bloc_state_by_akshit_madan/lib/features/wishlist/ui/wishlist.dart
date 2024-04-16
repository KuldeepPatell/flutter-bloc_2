// import 'package:bloc_state_by_akshit_madan/features/home/bloc/home_bloc.dart';
import 'package:bloc_state_by_akshit_madan/features/home/ui/home.dart';
import 'package:bloc_state_by_akshit_madan/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:bloc_state_by_akshit_madan/features/wishlist/ui/wishlist_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  final Home home = Home();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Wishlist")),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {
          if (state is WishlistRemoveFromWishlistAction) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Item removed from wishlist")));
          } else if (state is WishlistAddToCartAction) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Item added to cart")));
          }
        },
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              return ListView.builder(
                  itemCount: successState.wishlistItems.length,
                  itemBuilder: (context, index) {
                    return WishlistTileWidget(
                      wishlistBloc: wishlistBloc,
                      productDataModel: successState.wishlistItems[index],
                    );
                  });
            default:
          }
          return Container();
        },
      ),
    );
  }
}
