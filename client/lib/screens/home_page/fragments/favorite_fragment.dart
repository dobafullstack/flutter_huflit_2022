import 'package:flutter/material.dart';
import 'package:nda_18dh110793/models/favourite.dart';
import 'package:nda_18dh110793/models/product.dart';

import '../../../constants/colors.dart';

class FavoriteFragment extends StatefulWidget {
  const FavoriteFragment({Key? key}) : super(key: key);

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
        StreamBuilder(
            initialData: favorite.favorites,
            stream: favorite.favoriteStream,
            builder: (context, snapShot) {
              final favorites = snapShot.data as List<Product>;

              if (!snapShot.hasData || favorites.isEmpty) {
                return SliverFillRemaining(
                  child: Center(
                    child: Text(
                      "Favorite is null",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                );
              } else {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => FavoriteItem(
                      favorite: favorites[index],
                    ),
                    childCount: favorites.length,
                  ),
                );
              }
            })
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
