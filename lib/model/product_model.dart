
class ProductsList {
  final List<Product> products;

  ProductsList({
    this.products,
});

  factory ProductsList.fromJson(List<dynamic> parsedJson) {

    List<Product> products = List<Product>();
    products = parsedJson.map((i)=>Product.fromJson(i)).toList();

    return ProductsList(
      products: products
    );
  }
}


class Product{
  final String id;
  final String category;
  final String description;
  final String size;
  final double price;

  Product({
    this.id,
    this.category,
    this.description,
    this.size,
    this.price
}) ;

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json['id'],
      category: json['category'],
      description: json['description'],
      size: json['size'],
      price: json['price']
    );
  }

}
