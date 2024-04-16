import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_by_akshit_madan/data/cart_items.dart';
import 'package:bloc_state_by_akshit_madan/data/wishlist_item.dart';
import 'package:bloc_state_by_akshit_madan/features/home/models/home_product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveCartEvent);
    on<CartProductWishlistButtonCLickedEvent>(
        cartProductWishlistButtonCLickedEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productDataModel);
    emit(CartSuccessState(cartItems: cartItems));
    emit(CartRemoveFromCartAction());
  }

  FutureOr<void> cartProductWishlistButtonCLickedEvent(
      CartProductWishlistButtonCLickedEvent event, Emitter<CartState> emit) {
    print("Wishlist button clicked");
    wishlistItems.add(event.clickedProduct);
    emit(CartProductAddToWishlistAction());
  }
}
