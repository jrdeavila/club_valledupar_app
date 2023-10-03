import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

class ResturantController extends GetxController {
  final RxList<MenuSection> _menuSections = <MenuSection>[].obs;
  final Rx<MenuSection?> _selectedSection = Rx<MenuSection?>(null);

  List<MenuSection> get menuSections => _menuSections;
  MenuSection? get selectedSection => _selectedSection.value;

  void selectSection(MenuSection section) {
    _selectedSection.value = section;
  }

  @override
  void onReady() {
    super.onReady();
    _fetchMenuSections();
  }

  void _fetchMenuSections() {
    final fetchSectionsUseCase = getIt<FetchSectionsUseCase>();
    fetchSectionsUseCase.fetch().then((value) {
      _menuSections.value = value;
      _selectedSection.value = value.first;
    });
  }
}
