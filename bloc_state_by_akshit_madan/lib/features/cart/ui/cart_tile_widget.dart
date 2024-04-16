import 'package:bloc_state_by_akshit_madan/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_state_by_akshit_madan/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget(
      {super.key, required this.productDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(productDataModel.imageUrl))),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              productDataModel.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(productDataModel.description),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ ' + productDataModel.price.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          cartBloc.add(CartProductWishlistButtonCLickedEvent(
                              clickedProduct: productDataModel));
                        },
                        icon: Icon(Icons.favorite_border)),
                    IconButton(
                        onPressed: () {
                          cartBloc.add(CartRemoveFromCartEvent(
                              productDataModel: productDataModel));
                        },
                        icon: Icon(Icons.shopping_bag))
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
