import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

class ResturantController extends GetxController {
  final RxInt _currentIndex = 0.obs;

  final RxList<MenuSection> _filteredMenuSections = <MenuSection>[].obs;
  final RxList<MenuSection> _accompanimentSections = <MenuSection>[].obs;
  final RxList<MenuSection> _menuSections = <MenuSection>[].obs;
  final Rx<MenuSection?> _selectedSection = Rx<MenuSection?>(null);
  final RxList<MenuProduct> _menuProducts = <MenuProduct>[].obs;

  List<MenuSection> get menuSections => _filteredMenuSections;
  List<MenuProduct> get menuProducts => _menuProducts;
  List<MenuSection> get accompanimentSections => _accompanimentSections;
  MenuSection? get selectedSection => _selectedSection.value;
  int get currentIndex => _currentIndex.value;

  void selectSection(MenuSection section) {
    _selectedSection.value = section;
    _menuProducts.value = section.products.toList();
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
      _filteredMenuSections.value = value;
      _selectedSection.value = value.first;
      _accompanimentSections.value = _getOnlyAccompaniment(value);
      _menuProducts.value = value.first.products.toList();
    });
  }

  List<MenuSection> _getOnlyAccompaniment(Iterable<MenuSection> sections) {
    return sections.where((element) => element.isAccompaniment).toList();
  }

  void toggleShoppingCart() {
    if (_currentIndex.value == 1) {
      _currentIndex.value = 0;
      return;
    }
    _currentIndex.value = 1;
    return;
  }

  void searchSection(String value) {
    final filtered = _menuSections.where((element) {
      final name = element.name.toLowerCase();
      final description = element.description.toLowerCase();
      final search = value.toLowerCase();
      return name.contains(search) || description.contains(search);
    }).toList();
    _filteredMenuSections.value = filtered;
  }

  void searchProduct(String value) {
    if (selectedSection == null) return;
    final filtered = selectedSection!.products.where((element) {
      final name = element.name.toLowerCase();
      final description = element.description.toLowerCase();
      final search = value.toLowerCase();
      return name.contains(search) || description.contains(search);
    }).toList();
    _menuProducts.value = filtered;
  }
}
