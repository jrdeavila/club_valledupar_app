import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

class ShoppingCartController extends GetxController {
  final RxList<OrderDetail> _orderDetails = <OrderDetail>[].obs;
  final RxString _orderType = "club".obs;
  final RxString _address = "".obs;
  final ValidatorService _validatorService = getIt();

  final RxMap<String, dynamic> _errors = <String, dynamic>{}.obs;

  String get orderType => _orderType.value;
  List<OrderDetail> get orderDetails => _orderDetails;

  String get address => _address.value;

  List get errors => _errors.values.expand((element) => element).toList();

  double get total => _orderDetails.fold(
        0,
        (previousValue, element) => previousValue + element.total,
      );

  int get totalItems => _orderDetails.fold(
        0,
        (previousValue, element) => previousValue + element.quantity,
      );

  void toggleOrderDetail(OrderDetail orderDetail) {
    final exists = _orderDetails.any((element) => element.id == orderDetail.id);
    if (exists) {
      _orderDetails.removeWhere((element) => element.id == orderDetail.id);
    } else {
      _orderDetails.add(orderDetail);
    }
  }

  void setOrderType(String orderType) {
    _validatorService.deleteErrors();
    _orderType.value = orderType;
  }

  void setAddress(String address) {
    _validatorService.deleteErrors();
    _address.value = address;
  }

  void removeOrderDetail(OrderDetail orderDetail) {
    _orderDetails.removeWhere((element) => element.id == orderDetail.id);
    _orderDetails.refresh();
  }

  void increaseOrderDetail(OrderDetail orderDetail) {
    orderDetail.increateQuantity();
    _orderDetails.refresh();
  }

  void decreaseOrderDetail(OrderDetail orderDetail) {
    orderDetail.decreaseQuantity();
    _orderDetails.refresh();
  }

  bool productIsInShoppingCart(MenuProduct product) {
    return orderDetails.any((element) => element.id == product.id);
  }

  void addProductToShopping(MenuProduct product) {
    final orderDetail = OrderDetail(
      id: product.id,
      product: product,
      quantity: 1,
    );
    toggleOrderDetail(orderDetail);
  }

  @override
  void onReady() {
    super.onReady();
    _validatorService.onListen((p0) {
      _errors.value = p0;
    });
  }

  Future<void> createOrder() async {
    _validatorService.deleteErrors();
    final partner = Get.find<SessionController>().partner;
    final order = Order(
      id: "0",
      status: "pendiente",
      address: address,
      partner: partner!,
      details: _orderDetails,
      type: orderType,
    );

    final createOrderUseCase = getIt<CreateOrderUseCase>();
    await createOrderUseCase.create(order);

    Get.back();
    getIt<BannerService>().showBanner(
      BannerData(
        title: "Pedido creado",
        message: "Tu pedido ha sido creado con éxito",
        type: BannerType.success,
      ),
    );
    _clear();
  }

  void _clear() {
    _orderDetails.clear();
    _address.value = "";
    _orderType.value = "club";
  }

  void cancel() {
    _clear();
  }

  void addProductWithObservationToShopping(
      MenuProduct product, List<MenuProduct> accompaniments) {
    final orderDetail = OrderDetail(
      id: product.id,
      product: product,
      quantity: 1,
      observation: "Con ${accompaniments.map((e) => e.name).join(", ")}",
    );
    toggleOrderDetail(orderDetail);
  }
}
