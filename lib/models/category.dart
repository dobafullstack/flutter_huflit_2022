class Category{
  int id;
  String title;
  String image;

  Category({required this.id, required this.title, required this.image});
  
  static List<Category> init(){
    List<Category> data= [
      Category(id:1, title: "HighLand", image: "assets/images/ic_highland.jpeg" ),
      Category(id:2, title: "HighLand", image: "assets/images/ic_circlek.png" ),
      Category(id:3, title: "HighLand", image: "assets/images/ic_ministop.png" ),
      Category(id:4, title: "HighLand", image: "assets/images/ic_seveneleven.png" ),
      Category(id:5, title: "HighLand", image: "assets/images/ic_vinmart.jpg" ),
    ];
    return data;    
  }
}
