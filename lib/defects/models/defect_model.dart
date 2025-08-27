part of nice_hooks;


class DefectModel with ChangeNotifier {
  final String id;
  final String agent;
  final String region;
  final String productName;
  final String customerName;
  final String productColor;
  final String invoiceNumber;
  final Object invoiceDate;
  final String defectName;
  final String defectType;
  final String cause;
  final int quantity;
  final int verifiedQuantity;
  final String desc;
  final String imageUrl;
  final String postedBy;
  final String status;
  final String actionTaken;
  final String actionTakenBy;
  final String capaSerialNumber;
  final Object date;

  DefectModel({
    required this.id,
    required this.agent,
    required this.region,
    this.defectType = "",
    required this.productName,
    required this.customerName,
    required this.productColor,
    required this.invoiceNumber,
    required this.invoiceDate,
    this.defectName = "",
    this.cause = "",
    required this.quantity,
    this.verifiedQuantity = 0,
    required this.desc,
    required this.imageUrl,
    required this.postedBy,
    required this.date,
    this.status = "open",
    this.actionTaken = "",
    this.actionTakenBy = "",
    this.capaSerialNumber = "",
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'agent': agent,
      'region': region,
      'defect_type': defectType,
      'product_name': productName,
      'customer_name': customerName,
      'product_color': productColor,
      'invoice_number': invoiceNumber,
      'invoice_date': invoiceDate,
      'defect_name': defectName,
      'cause': cause,
      'quantity': quantity,
      'verified_quantity': verifiedQuantity,
      'desc': desc,
      'image_url': imageUrl,
      'posted_by': postedBy,
      'date': date,
      'status': status,
      'action_taken': actionTaken,
      'action_taken_by': actionTakenBy,
      'capa_serial_number': capaSerialNumber,
    };
  }

  factory DefectModel.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map;
    return DefectModel(
      id: snapshot.id,
      agent: data['agent'] ?? "Missing",
      region: data['region'] ?? "Missing",
      productName: data['product_name'] ?? "Missing",
      customerName: data['customer_name'] ?? "Missing",
      productColor: data['product_color'] ?? "Missing",
      invoiceNumber: data['invoice_number'] ?? "Missing",
      invoiceDate: data['invoice_date'].toDate() ?? "Missing",
      defectType: data['defect_type'] ?? "",
      defectName: data['defect_name'] ?? "",
      cause: data['cause'] ?? "",
      quantity: data['quantity'] ?? 0,
      verifiedQuantity: data['verified_quantity'] ?? 0,
      desc: data['desc'] ?? "Missing",
      imageUrl: data['image_url'],
      postedBy: data['posted_by'],
      date: data['date'].toDate(),
      status: data['status'],
      actionTaken: data['action_taken'],
      actionTakenBy: data['action_taken_by'],
      capaSerialNumber: data['capa_serial_number'],
    );
  }
}
