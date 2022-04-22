import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nda_18dh110793/models/product.dart';

import '../../../constants/colors.dart';
import '../../../models/category.dart';

class FavoriteFragment extends StatefulWidget {
  final List<Product> favorites = Product.init();

  FavoriteFragment({Key? key}) : super(key: key);

  @override
  State<FavoriteFragment> createState() => _FavoriteFragmentState();
}

class _FavoriteFragmentState extends State<FavoriteFragment> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: 0,
          backgroundColor: MyColors.PRIMARY_COLOR,
          title: Text("Favorite"),
          leading: Container(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => FavoriteItem(
              favorite: widget.favorites[index],
            ),
            childCount: widget.favorites.sublist(0, 2).length,
          ),
        )
      ],
    );
  }
}

class FavoriteItem extends StatelessWidget {
  Product favorite;

  FavoriteItem({required this.favorite});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 150,
              width: 150,
              child: Image(image: AssetImage(favorite.image))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                favorite.title,
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                  width: width - 150 - 32, child: Text(favorite.description)),
            ],
          )
        ],
      ),
    );
  }
}
