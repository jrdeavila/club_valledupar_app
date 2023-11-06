class MenuSection {
  final String id;
  final String name;
  final String description;
  final bool isAccompaniment;
  final bool accompanying;
  final Iterable<MenuProduct> products;

  MenuSection({
    required this.id,
    required this.name,
    required this.description,
    required this.products,
    required this.isAccompaniment,
    required this.accompanying,
  });
}

class MenuProduct {
  final String id;
  final String name;
  final String description;
  final double price;
  final String? image;

  MenuProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.image,
  });
}
