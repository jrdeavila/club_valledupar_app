import 'package:club_valledupar_app/lib.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchSectionsUseCase {
  final RestaurantRepository _restaurantRepository;

  const FetchSectionsUseCase(this._restaurantRepository);

  Future<List<MenuSection>> fetch() {
    return _restaurantRepository.getMenuSections();
  }
}
