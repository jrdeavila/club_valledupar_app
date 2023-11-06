import 'package:club_valledupar_app/src/domain/domain.dart';
import 'package:club_valledupar_app/src/infrastructure/infrastructure.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RequestDocumentRepository)
class HttpRequestDocumentRepository implements RequestDocumentRepository {
  final HttpClient _httpClient;

  HttpRequestDocumentRepository(this._httpClient);

  @override
  Future<Iterable<Document>> getDocuments() {
    return _httpClient
        .get<JSON>("/document-requests")
        .then((value) => documentListFromJson(value['data']));
  }

  @override
  Future<Document> storeDocument({required DocumentType documentType}) {
    return _httpClient.post<JSON>("/document-requests", data: {
      "document_request_type_id": documentType.id,
    }).then((value) => documentFromJSON(value['data']));
  }
}

@Injectable(as: RequestDocumentTypeRepository)
class HttpRequestDocumentTypeRepository
    implements RequestDocumentTypeRepository {
  final HttpClient _httpClient;

  HttpRequestDocumentTypeRepository(this._httpClient);

  @override
  Future<Iterable<DocumentType>> getDocumentTypes() {
    return _httpClient
        .get<JSON>("/document-requests/types")
        .then((value) => documentTypeListFromJson(value['data']));
  }
}
