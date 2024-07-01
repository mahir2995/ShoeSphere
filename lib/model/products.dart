class Product {
  String? title;
  double? price;
  String? description;
  String? image;
  Rating? rating;

  Product({this.title,this.price,this.description,this.image,this.rating});

  Product.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    description = json['description'];

    image = json['image'];
    rating = json ['rating']!= null ? Rating.fromJson(json['rating']) : null;

  }
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = < String , dynamic>{};

    data['title'] = title;
    data['price'] = price;
    data ['description'] = description;
    data['image'] = image;
    if(rating != null){
      data ['rating'] = rating !.toJson();
    }
    return data;
  }
}
class Rating{
  double?rate;
  int? count;

  Rating ({this.rate,this.count});

  Rating.fromJson(Map<String , dynamic>json){
    rate=json['rate'];
    count = json ['count'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = < String , dynamic>{};

    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}
List<Product> products = [
  Product(
    title:"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    price:109.95,
    description:"Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",

    image:"https://fakestoreapi.com/img/81fPKd-2AYL.AC_SL1500.jpg",
    rating : Rating(rate:3.9 , count:120 ),
  ),
  Product(
    title:"Mens Casual Premium Slim Fit T-Shirts",
    price:22.3,
    description:"Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",

    image:"https://fakestoreapi.com/img/71-3HjGNDUL.AC_SY879._SX._UX._SY._UY.jpg",
    rating : Rating(rate:4.1 , count:259 ),
  ),
  Product(
    title:"Mens Cotton Jacket",
    price:55.99,
    description:"great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.",

    image:"https://fakestoreapi.com/img/71li-ujtlUL.AC_UX679.jpg",
    rating : Rating(rate:4.7 , count:500),
  ),
  Product(
    title:"Mens Casual Slim Fit",
    price:15.99,
    description:"The color could be slightly different between on the screen and in practice",

    image:"https://fakestoreapi.com/img/71YXzeOuslL.AC_UY879.jpg",
    rating : Rating(rate:2.1 , count:430 ),
  ),

];