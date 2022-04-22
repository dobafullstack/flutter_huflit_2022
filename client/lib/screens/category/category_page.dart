import 'package:flutter/material.dart';
import 'package:nda_18dh110793/models/category.dart';
import 'package:nda_18dh110793/models/product.dart';
import 'package:nda_18dh110793/screens/home_page/components/product_item.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final products = Product.init()
        .where((item) => item.category_id == category.id)
        .toList();
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(category.title),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(category.image),
                      fit: BoxFit.fitHeight)),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            sliver: SliverToBoxAdapter(
                child: Text("Products",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ))),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => ProductItem(product: products[index]),
                    childCount: products.length),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 10)),
          ),
        ],
      ),
    );
  }
}
