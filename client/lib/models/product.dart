class Product {
  int id;
  String title;
  String description;
  int category_id;
  String image;
  double price;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.category_id,
      required this.price});

  static List<Product> init() {
    List<Product> data = [
      Product(
          id: 1,
          category_id: 1,
          title: "Bread",
          description:
              "Founded as a bakery brand in Singapore in 2000 and listed on the SGX in 2003. It has since expanded to more than 1,000 retail stores spread across 17 markets. Its brand portfolio comprises BreadTalk, Toast Box, Food Republic, Food Junction, Din Tai Fung, Bread Society, Thye Moh Chan, The Icing Room, SÅ and Nayuki in Singapore. Din Tai Fung, Song Fa Bak Kut Teh, Wu Pao Chun and Nayuki are franchised brands",
          image: "assets/foods/ic_black_coffee.png",
          price: 8.0),
      Product(
          id: 2,
          category_id: 1,
          title: "Coffee",
          description:
              "Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffea species. When coffee berries turn from green to bright red in color â indicating ripeness â they are picked, processed, and dried.[2] Dried coffee seeds (referred to as \"beans\") are roasted to varying degrees, depending on the desired flavor. Roasted beans are ground and then brewed with near-boiling water to produce the beverage known as coffee.",
          image: "assets/foods/ic_black_coffee.png",
          price: 8.0),
      Product(
          id: 3,
          category_id: 2,
          title: "Tea",
          description:
              "Tea is an aromatic beverage commonly prepared by pouring hot or boiling water over cured or fresh leaves of the Camellia sinensis, an evergreen shrub native to East Asia.[3] After water, it is the most widely consumed drink in the world.[4] There are many different types of tea; some, like Darjeeling and Chinese greens, have a cooling, slightly bitter, and astringent flavour,[5] while others have vastly different profiles that include sweet, nutty, floral, or grassy notes. Tea has a stimulating effect in humans primarily by its caffeine conten",
          image: "assets/foods/ic_black_coffee.png",
          price: 8.0),
      Product(
          id: 4,
          category_id: 2,
          title: "Bread",
          description:
              "Tea is an aromatic beverage commonly prepared by pouring hot or boiling water over cured or fresh leaves of the Camellia sinensis, an evergreen shrub native to East Asia.[3] After water, it is the most widely consumed drink in the world.[4] There are many different types of tea; some, like Darjeeling and Chinese greens, have a cooling, slightly bitter, and astringent flavour,[5] while others have vastly different profiles that include sweet, nutty, floral, or grassy notes. Tea has a stimulating effect in humans primarily by its caffeine conten",
          image: "assets/foods/ic_black_coffee.png",
          price: 8.0),
      Product(
          id: 5,
          category_id: 3,
          title: "Coffee",
          description:
              "Founded as a bakery brand in Singapore in 2000 and listed on the SGX in 2003. It has since expanded to more than 1,000 retail stores spread across 17 markets. Its brand portfolio comprises BreadTalk, Toast Box, Food Republic, Food Junction, Din Tai Fung, Bread Society, Thye Moh Chan, The Icing Room, SÅ and Nayuki in Singapore. Din Tai Fung, Song Fa Bak Kut Teh, Wu Pao Chun and Nayuki are franchised brands",
          image: "assets/foods/ic_black_coffee.png",
          price: 8.0),
      Product(
          id: 6,
          category_id: 3,
          title: "milk & Tea",
          description:
              "Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffea species. When coffee berries turn from green to bright red in color â indicating ripeness â they are picked, processed, and dried.[2] Dried coffee seeds (referred to as \"beans\") are roasted to varying degrees, depending on the desired flavor. Roasted beans are ground and then brewed with near-boiling water to produce the beverage known as coffee.",
          image: "assets/foods/ic_black_coffee.png",
          price: 8.0),
      Product(
          id: 7,
          category_id: 1,
          title: "Bread",
          description:
              "Founded as a bakery brand in Singapore in 2000 and listed on the SGX in 2003. It has since expanded to more than 1,000 retail stores spread across 17 markets. Its brand portfolio comprises BreadTalk, Toast Box, Food Republic, Food Junction, Din Tai Fung, Bread Society, Thye Moh Chan, The Icing Room, SÅ and Nayuki in Singapore. Din Tai Fung, Song Fa Bak Kut Teh, Wu Pao Chun and Nayuki are franchised brands",
          image: "assets/foods/ic_black_coffee.png",
          price: 8.0),
      Product(
          id: 8,
          category_id: 4,
          title: "Coffee",
          description:
              "Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffea species. When coffee berries turn from green to bright red in color â indicating ripeness â they are picked, processed, and dried.[2] Dried coffee seeds (referred to as \"beans\") are roasted to varying degrees, depending on the desired flavor. Roasted beans are ground and then brewed with near-boiling water to produce the beverage known as coffee.",
          image: "assets/foods/ic_black_coffee.png",
          price: 8.0),
      Product(
          id: 9,
          category_id: 1,
          title: "Tea",
          description:
              "Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffea species. When coffee berries turn from green to bright red in color â indicating ripeness â they are picked, processed, and dried.[2] Dried coffee seeds (referred to as \"beans\") are roasted to varying degrees, depending on the desired flavor. Roasted beans are ground and then brewed with near-boiling water to produce the beverage known as coffee.",
          image: "assets/foods/ic_black_coffee.png",
          price: 8.0),
      Product(
          id: 10,
          category_id: 1,
          title: "Bread",
          description:
              "Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffea species. When coffee berries turn from green to bright red in color â indicating ripeness â they are picked, processed, and dried.[2] Dried coffee seeds (referred to as \"beans\") are roasted to varying degrees, depending on the desired flavor. Roasted beans are ground and then brewed with near-boiling water to produce the beverage known as coffee.",
          image: "assets/foods/ic_black_coffee.png",
          price: 8.0),
      Product(
          id: 11,
          category_id: 1,
          title: "Coffee",
          description:
              "Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffea species. When coffee berries turn from green to bright red in color â indicating ripeness â they are picked, processed, and dried.[2] Dried coffee seeds (referred to as \"beans\") are roasted to varying degrees, depending on the desired flavor. Roasted beans are ground and then brewed with near-boiling water to produce the beverage known as coffee.",
          image: "assets/foods/ic_black_coffee.png",
          price: 8.0),
      Product(
          id: 12,
          category_id: 1,
          title: "milk & Tea",
          description:
              "Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffea species. When coffee berries turn from green to bright red in color â indicating ripeness â they are picked, processed, and dried.[2] Dried coffee seeds (referred to as \"beans\") are roasted to varying degrees, depending on the desired flavor. Roasted beans are ground and then brewed with near-boiling water to produce the beverage known as coffee.",
          image: "assets/foods/ic_black_coffee.png",
          price: 8.0),
    ];

    return data;
  }
}
