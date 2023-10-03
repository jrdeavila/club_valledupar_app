import 'package:club_valledupar_app/lib.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RestaurantRepository)
class HttpResturantRepository implements RestaurantRepository {
  final HttpClient _httpClient;

  const HttpResturantRepository(this._httpClient);
  @override
  Future<List<MenuSection>> getMenuSections() {
    return _httpClient
        .get<JSON>("/sections")
        .then((value) => menuSectionListFromJson(value['data']));
  }
}
