import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

class ResturantController extends GetxController {
  final RxInt _currentIndex = 0.obs;

  final RxList<MenuSection> _menuSections = <MenuSection>[].obs;
  final Rx<MenuSection?> _selectedSection = Rx<MenuSection?>(null);

  List<MenuSection> get menuSections => _menuSections;
  MenuSection? get selectedSection => _selectedSection.value;
  int get currentIndex => _currentIndex.value;

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

  void toggleShoppingCart() {
    if (_currentIndex.value == 1) {
      _currentIndex.value = 0;
      return;
    }
    _currentIndex.value = 1;
    return;
  }

  void addProductToShopping(MenuProduct product) {
    final shoppingCartController = Get.find<ShoppingCartController>();
    final orderDetail = OrderDetail(
      id: product.id,
      product: product,
      quantity: 1,
    );
    shoppingCartController.addOrderDetail(orderDetail);
  }
}
