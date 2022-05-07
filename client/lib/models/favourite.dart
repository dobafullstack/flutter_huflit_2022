import 'dart:async';

import 'package:nda_18dh110793/models/product.dart';

class Favorite {
  late List<Product> favorites = [];
  StreamController favoriteController =
      StreamController<List<Product>>.broadcast();
  Stream get favoriteStream => favoriteController.stream;

  addToFavorite(Product product) {
    if (checkInFavorite(product)) {
      favorites.removeWhere((element) => product.id == element.id);
    } else {
      favorites.add(product);
    }
    favoriteController.sink.add(favorites);
  }

  bool checkInFavorite(Product product) {
    int existingIndex =
        favorites.indexWhere((element) => element.id == product.id);

    if (existingIndex >= 0) return true;

    return false;
  }

  void dispose() {
    favoriteController.close();
  }
}

final Favorite favorite = Favorite();
