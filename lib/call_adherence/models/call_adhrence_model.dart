part of nice_hooks;

class CallAdherenceModel with ChangeNotifier {
  final String id;
  final String userID;
  final String callerPhone;
  final String customerName;
  final String customerPhone;
  final String customerId;
  final String dateClean;
  final Object date;

  CallAdherenceModel({
    required this.id,
    required this.userID,
    required this.callerPhone,
    required this.customerName,
    required this.customerPhone,
    required this.customerId,
    required this.dateClean,
    required this.date,
  });

  CallAdherenceModel copyWith({
    String? id,
    String? userID,
    String? callerPhone,
    String? customerName,
    String? customerPhone,
    String? customerId,
    String? dateClean,
    Object? date,
  }) {
    return CallAdherenceModel(
      id: id ?? this.id,
      userID: userID ?? this.userID,
      callerPhone: callerPhone ?? this.callerPhone,
      customerName: customerName ?? this.customerName,
      customerPhone: customerPhone ?? this.customerPhone,
      customerId: customerId ?? this.customerId,
      dateClean: dateClean ?? this.dateClean,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'caller_id': userID,
      'caller_phone': callerPhone,
      'customer_name': customerName,
      'customer_phone': customerPhone,
      'customer_id': customerId,
      'clean_date': dateClean,
      'date': date,
    };
  }

  factory CallAdherenceModel.fromFireStore(DocumentSnapshot documentSnapshot) {
    var data = documentSnapshot.data() as Map;
    // print(data);
    return CallAdherenceModel(
      id: documentSnapshot.id,
      userID: data["caller_id"],
      callerPhone: data["caller_phone"],
      customerName: data["customer_name"],
      customerPhone: data["customer_phone"],
      customerId: data["customer_id"] ?? "Missing",
      dateClean: data["clean_date"],
      date: data["date"].toDate(),
    );
  }

  @override
  String toString() {
    return 'CallAdherenceModel(id: $id, userID: $userID, callerPhone: $callerPhone, customerName: $customerName, customerPhone: $customerPhone, customerId: $customerId, dateClean: $dateClean, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CallAdherenceModel &&
        other.id == id &&
        other.userID == userID &&
        other.callerPhone == callerPhone &&
        other.customerName == customerName &&
        other.customerPhone == customerPhone &&
        other.customerId == customerId &&
        other.dateClean == dateClean &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userID.hashCode ^
        callerPhone.hashCode ^
        customerName.hashCode ^
        customerPhone.hashCode ^
        customerId.hashCode ^
        dateClean.hashCode ^
        date.hashCode;
  }
}
