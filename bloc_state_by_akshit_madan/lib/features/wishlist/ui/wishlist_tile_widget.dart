// import 'package:bloc_state_by_akshit_madan/features/home/bloc/home_bloc.dart';
import 'package:bloc_state_by_akshit_madan/features/home/models/home_product_data_model.dart';
import 'package:bloc_state_by_akshit_madan/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WishlistTileWidget extends StatefulWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;
  const WishlistTileWidget({
    super.key,
    required this.productDataModel,
    required this.wishlistBloc,
  });

  @override
  State<WishlistTileWidget> createState() => _WishlistTileWidgetState();
}

class _WishlistTileWidgetState extends State<WishlistTileWidget> {
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
                      image: NetworkImage(widget.productDataModel.imageUrl))),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.productDataModel.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(widget.productDataModel.description),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ ' + widget.productDataModel.price.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {});
                          widget.wishlistBloc.add(
                              WishlistRemoveFromWishlistEvent(
                                  clickedProduct: widget.productDataModel));
                        },
                        icon: widget.productDataModel.isFavorite
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(Icons.favorite_border)),
                    IconButton(
                        onPressed: () {
                          widget.wishlistBloc.add(WishlistAddToCartEvent(
                              clickedProduct: widget.productDataModel));
                        },
                        icon: Icon(Icons.shopping_bag_outlined))
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
