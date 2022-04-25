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
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 32),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return InkWell(
                  onTap: () => Navigator.pushNamed(context, "/product-detail",
                      arguments: products[index]),
                  child: SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        Image.asset(
                          products[index].image,
                          width: 100,
                          height: 100,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products[index].title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 250,
                              child: Text(
                                products[index].description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }, childCount: products.length),
            ),
          )
        ],
      ),
    );
  }
}
