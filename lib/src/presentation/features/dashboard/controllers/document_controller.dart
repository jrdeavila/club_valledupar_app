import 'package:club_valledupar_app/lib.dart';
import 'package:get/get.dart';

class DocumentController extends GetxController {
  final RxList<Document> _documents = <Document>[].obs;
  final RxList<DocumentType> _documentTypes = <DocumentType>[].obs;
  final RxBool _isLoading = false.obs;

  List<Document> get documents => _documents;

  List<DocumentType> get documentTypes => _documentTypes;
  bool get isLoading => _isLoading.value;

  void _fetchDocuments() async {
    final useCase = getIt<ConsultAllDocumentUseCase>();
    _isLoading.value = true;
    final res = await useCase.call();
    _documents.value = res.toList();
    _isLoading.value = false;
  }

  void fetchDocumentTypes() async {
    final useCase = getIt<ConsultAllDocumentTypesUseCase>();
    _isLoading.value = true;
    final res = await useCase.call();
    _documentTypes.value = res.toList();
    _isLoading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
    _fetchDocuments();
  }

  void selectDocumentType(DocumentType documentType) {
    final useCase = getIt<CreateDocumentUseCase>();
    useCase.call(documentType).then((value) {
      _documents.add(value);
    });
  }

  String formatDate(String date) {
    var timeFormatService = getIt<TimeFormatService>();
    final datetime = timeFormatService.parseTime(date);
    return timeFormatService.formatTime(datetime);
  }
}
