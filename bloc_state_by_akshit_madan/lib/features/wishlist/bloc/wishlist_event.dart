part of 'wishlist_bloc.dart';

abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistRemoveFromWishlistEvent extends WishlistEvent {
  final ProductDataModel clickedProduct;

  WishlistRemoveFromWishlistEvent({required this.clickedProduct});
}

class WishlistAddToCartEvent extends WishlistEvent {
  final ProductDataModel clickedProduct;
  WishlistAddToCartEvent({required this.clickedProduct});
}
