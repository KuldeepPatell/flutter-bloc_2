import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_by_akshit_madan/data/cart_items.dart';
import 'package:bloc_state_by_akshit_madan/data/wishlist_item.dart';
import 'package:bloc_state_by_akshit_madan/features/home/models/home_product_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveFromWishlistEvent>(wishlistRemoveWishlistEvent);
    on<WishlistAddToCartEvent>(wishlistAddToCartAction);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistRemoveWishlistEvent(
      WishlistRemoveFromWishlistEvent event, Emitter<WishlistState> emit) {
    // productDataModel: successState.products[index])
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
    event.clickedProduct.isFavorite = false;
    wishlistItems.remove(event.clickedProduct);
    emit(WishlistRemoveFromWishlistAction());
  }

  FutureOr<void> wishlistAddToCartAction(
      WishlistAddToCartEvent event, Emitter<WishlistState> emit) {
    cartItems.add(event.clickedProduct);
    emit(WishlistAddToCartAction());
  }
}
