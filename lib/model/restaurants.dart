class Restaurant{

  String? imageUrl;
  String? name;
  String? categories;
  int? pricePerPerson;
  double? rating;

  Restaurant({this.imageUrl, this.name, this.categories, this.pricePerPerson, this.rating});

  toMap() => {
    "imageUrl": imageUrl,
    "name": name,
    "categories": categories,
    "pricePerPerson": pricePerPerson,
    "rating": rating
  };

  @override
  String toString() {
    return 'Restaurant{imageUrl: $imageUrl, name: $name, categories: $categories,'
        'pricePerPerson: $pricePerPerson, rating: $rating}';
  }
}