import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

class ShoppingCartController extends GetxController {
  final RxList<OrderDetail> _orderDetails = <OrderDetail>[].obs;
  final RxBool _isDomicile = false.obs;
  final RxString _address = "".obs;
  final ValidatorService _validatorService = getIt();

  final RxMap<String, dynamic> _errors = <String, dynamic>{}.obs;

  List<OrderDetail> get orderDetails => _orderDetails;
  bool get isDomicile => _isDomicile.value;

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

  void addOrderDetail(OrderDetail orderDetail) {
    final exists = _orderDetails.any((element) => element.id == orderDetail.id);
    if (exists) {
      final getCurrentIndex = _orderDetails.indexWhere(
        (element) => element.id == orderDetail.id,
      );
      orderDetail.addOrderDetail(_orderDetails[getCurrentIndex]);
      _orderDetails.insert(getCurrentIndex, orderDetail);
    } else {
      _orderDetails.add(orderDetail);
    }
  }

  void setDomicile(bool isDomicile) => _isDomicile.value = isDomicile;

  void setAddress(String address) => _address.value = address;

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
      isDomicile: isDomicile,
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
    _isDomicile.value = false;
    _address.value = "";
  }

  void cancel() {
    _clear();
  }
}
