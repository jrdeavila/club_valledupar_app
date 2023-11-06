import 'package:club_valledupar_app/lib.dart';

abstract class RequestDocumentRepository {
  Future<Iterable<Document>> getDocuments();

  Future<Document> storeDocument({
    required DocumentType documentType,
  });
}

abstract class RequestDocumentTypeRepository {
  Future<Iterable<DocumentType>> getDocumentTypes();
}
