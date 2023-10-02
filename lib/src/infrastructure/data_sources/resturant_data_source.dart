import 'package:club_valledupar_app/lib.dart';

typedef JSON = Map<String, dynamic>;

MenuSection menuSectionFromJson(JSON json) => MenuSection(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      products: List<MenuProduct>.from(
        json['menu_items'].map(menuProductFromJson),
      ),
    );

MenuProduct menuProductFromJson(JSON json) => MenuProduct(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      image: json['image'],
    );

JSON menuProductToJson(MenuProduct menuProduct) => {
      'id': menuProduct.id,
      'name': menuProduct.name,
      'description': menuProduct.description,
      'price': menuProduct.price,
      'image': menuProduct.image,
    };

List<MenuSection> menuSectionListFromJson(List<dynamic> json) =>
    List<MenuSection>.from(json.map((x) => menuSectionFromJson(x)));
