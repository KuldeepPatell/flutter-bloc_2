part of 'cart_bloc.dart';

abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {
  final ProductDataModel productDataModel;

  CartRemoveFromCartEvent({required this.productDataModel});
}

class CartProductWishlistButtonCLickedEvent extends CartEvent {
  final ProductDataModel clickedProduct;

  CartProductWishlistButtonCLickedEvent({required this.clickedProduct});
}
