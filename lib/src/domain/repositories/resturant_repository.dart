import 'package:club_valledupar_app/lib.dart';

abstract class RestaurantRepository {
  Future<List<MenuSection>> getMenuSections();
}
