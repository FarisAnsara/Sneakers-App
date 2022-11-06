
class Shoe {
  final int id;
  final String name;
  final String brand;
  final String gender;
  final String category;
  final int price;
  final bool inInventory;
  final int itemsLeft;
  final String urlImage;

  const Shoe({required this.id,
    required this.name,
    required this.brand,
    required this.gender,
    required this.category,
    required this.price,
    required this.inInventory,
    required this.itemsLeft,
    required this.urlImage});

  factory Shoe.fromJson(Map<String, dynamic> json) {
    return Shoe(
        id: json['id'],
        name: json['name'],
        brand: json['brand'],
        gender: json['gender'],
        category: json['category'],
        price: json['price'],
        inInventory: json['is_in_inventory'],
        itemsLeft: json['items_left'],
        urlImage: json['imageURL']);
  }

  @override
  String toString() {
    return 'id: $id \n'
        'name: $name \n'
        'brand: $brand \n'
        'gender: $gender \n'
        'category: $category \n'
        'price: $price \n'
        'inInventory: $inInventory \n'
        'itemsLeft: $itemsLeft \n'
        'urlImage: $urlImage';
  }
}
