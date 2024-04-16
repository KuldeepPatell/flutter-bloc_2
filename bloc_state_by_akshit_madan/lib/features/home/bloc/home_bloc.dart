import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_state_by_akshit_madan/data/cart_items.dart';
import 'package:bloc_state_by_akshit_madan/data/grocery_data.dart';
import 'package:bloc_state_by_akshit_madan/data/wishlist_item.dart';
import 'package:bloc_state_by_akshit_madan/features/home/models/home_product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonCLickedEvent>(
        homeProductWishlistButtonCLickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl'],
                isFavorite: false))
            .toList()));
  }

  FutureOr<void> homeProductWishlistButtonCLickedEvent(
      HomeProductWishlistButtonCLickedEvent event, Emitter<HomeState> emit) {
    print("Wishlist button clicked");
    if (event.clickedProduct.isFavorite) {
      event.clickedProduct.isFavorite = false;
      wishlistItems.remove(event.clickedProduct);
      emit(HomeProductWishlistAction("Item Removed From Favorite"));
    } else {
      event.clickedProduct.isFavorite = true;
      wishlistItems.add(event.clickedProduct);
      emit(HomeProductWishlistAction("Item Added To Favorite"));
    }
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Cart button clicked");
    cartItems.add(event.clickedProduct);
    emit(HomeProductAddToCartAction());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Wishlist navigate clicked");
    emit(HomeNavigateTOWIshlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Cart navigate clicked");
    emit(HomeNavigateToCartPageActionState());
  }
}
