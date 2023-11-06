import 'package:club_valledupar_app/src/domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConsultAllDocumentUseCase {
  final RequestDocumentRepository _requestDocumentRepository;

  ConsultAllDocumentUseCase(this._requestDocumentRepository);

  Future<Iterable<Document>> call() {
    return _requestDocumentRepository.getDocuments();
  }
}

@injectable
class ConsultAllDocumentTypesUseCase {
  final RequestDocumentTypeRepository _requestDocumentRepository;

  ConsultAllDocumentTypesUseCase(this._requestDocumentRepository);

  Future<Iterable<DocumentType>> call() {
    return _requestDocumentRepository.getDocumentTypes();
  }
}

@injectable
class CreateDocumentUseCase {
  final RequestDocumentRepository _requestDocumentRepository;

  CreateDocumentUseCase(this._requestDocumentRepository);

  Future<Document> call(DocumentType documentType) {
    return _requestDocumentRepository.storeDocument(documentType: documentType);
  }
}
