class Document {
  final int id;
  final String documentRequestType;
  final String status;
  final String createdAt;
  final String updatedAt;

  Document({
    required this.id,
    required this.documentRequestType,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });
}

class DocumentType {
  final int id;
  final String name;
  final String description;

  DocumentType({
    required this.id,
    required this.name,
    required this.description,
  });
}

final statusLabel = {
  "pending": "Pendiente",
  "approved": "Aprobado",
  "rejected": "Rechazado",
};
