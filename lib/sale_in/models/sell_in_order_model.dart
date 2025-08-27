part of nice_hooks;

class SellInOrderModel with ChangeNotifier {
  final String orderId;
  final String userID;
  final String agent;
  final String customerName;
  final String route;
  final String region;
  final String customerPhoneNumber;
  final double amount;
  final String status;
  final List<dynamic> cartItems;
  final Object date;
  // New Variables to make it a SaleInOrderModel
  final double receivedTotal;
  final double dispatchedTotal;
  final String dispatchedBy;
  final String driverName;
  final String driverPhoneNumber;
  final String truckNumber;
  final String invoiceNumber;

  SellInOrderModel({
    required this.orderId,
    required this.userID,
    required this.agent,
    required this.customerName,
    required this.customerPhoneNumber,
    required this.route,
    required this.region,
    required this.amount,
    this.status = "PENDING",
    required this.cartItems,
    required this.date,
    this.receivedTotal = 0,
    this.dispatchedTotal = 0,
    this.dispatchedBy = "NA",
    this.driverName = "NA",
    this.driverPhoneNumber = "NA",
    this.truckNumber = "NA",
    this.invoiceNumber = "NA",
    //  date: DateTime.now(),
    // receivedTotal: 0,
    // dispatchedTotal: 0,
  });

  factory SellInOrderModel.fromFireStore(DocumentSnapshot documentSnapshot) {
    var data = documentSnapshot.data() as Map;
    return SellInOrderModel(
      orderId: documentSnapshot.id,
      userID: data["user"],
      agent: data["agent"],
      customerName: data["customerName"],
      customerPhoneNumber: data["customerPhoneNumber"],
      route: data["route"],
      region: data["region"] ?? "Missing",
      amount: data["total"],
      status: data["status"],
      cartItems: data["items"],
      date: data["date"].toDate(),
      receivedTotal: data["received_total"].toDouble(),
      dispatchedTotal: data["dispatched_total"].toDouble(),
      dispatchedBy: data["dispatched_by"],
      driverName: data["driverName"],
      driverPhoneNumber: data["driverPhoneNumber"],
      truckNumber: data["truckNumber"],
      invoiceNumber: data["invoiceNumber"],
    );
  }

  // toMap
  Map<String, dynamic> toMap() {
    return {
      "user": userID,
      "agent": agent,
      "customerName": customerName,
      "customerPhoneNumber": customerPhoneNumber,
      "route": route,
      "region": region,
      "total": amount,
      "status": status,
      "items": cartItems,
      "date": date,
      "received_total": receivedTotal,
      "dispatched_total": dispatchedTotal,
      "dispatched_by": dispatchedBy,
      "driverName": driverName,
      "driverPhoneNumber": driverPhoneNumber,
      "truckNumber": truckNumber,
      "invoiceNumber": invoiceNumber,
    };
  }

  // toString
  @override
  String toString() {
    return 'SellInOrderModel{orderId: $orderId, userID: $userID, agent: $agent, customerName: $customerName, route: $route, region: $region, customerPhoneNumber: $customerPhoneNumber, amount: $amount, status: $status, cartItems: $cartItems, date: $date, receivedTotal: $receivedTotal, dispatchedTotal: $dispatchedTotal, dispatchedBy: $dispatchedBy, driverName: $driverName, driverPhoneNumber: $driverPhoneNumber, truckNumber: $truckNumber, invoiceNumber: $invoiceNumber}';
  }
}
