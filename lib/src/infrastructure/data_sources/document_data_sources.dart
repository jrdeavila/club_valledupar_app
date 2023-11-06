import 'package:club_valledupar_app/lib.dart';

Document documentFromJSON(JSON json) {
  return Document(
    id: json["id"],
    status: json["status"],
    documentRequestType: json["document_request_type"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );
}

Iterable<Document> documentListFromJson(List list) {
  return list.map((e) => documentFromJSON(e)).toList();
}

Iterable<DocumentType> documentTypeListFromJson(List list) {
  return list.map((e) => documentTypeFromJSON(e)).toList();
}

DocumentType documentTypeFromJSON(JSON json) {
  return DocumentType(
    id: json["id"],
    name: json["name"],
  );
}
