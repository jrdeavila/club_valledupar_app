import 'package:club_valledupar_app/lib.dart';

class HttpResturantRepository implements RestaurantRepository {
  final HttpClient _httpClient;

  const HttpResturantRepository(this._httpClient);
  @override
  Future<List<MenuSection>> getMenuSections() {
    return _httpClient
        .get<List<JSON>>("/cartas")
        .then((value) => menuSectionListFromJson(value));
  }
}
