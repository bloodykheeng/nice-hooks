part of nice_hooks;

class SellOutOrderModel with ChangeNotifier {
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
  final String customerID;

  SellOutOrderModel({
    required this.orderId,
    required this.userID,
    required this.agent,
    required this.customerName,
    required this.route,
    required this.region,
    required this.customerPhoneNumber,
    required this.amount,
    required this.status,
    required this.cartItems,
    required this.date,
    required this.customerID,
  });

  // toString
  @override
  String toString() {
    return 'SellOutOrderModel(orderId: $orderId, userID: $userID, agent: $agent, customerName: $customerName, route: $route, region: $region, customerPhoneNumber: $customerPhoneNumber, amount: $amount, status: $status, cartItems: $cartItems, date: $date, customerID: $customerID)';
  }

  SellOutOrderModel copyWith({
    String? orderId,
    String? userID,
    String? agent,
    String? customerName,
    String? route,
    String? region,
    String? customerPhoneNumber,
    double? amount,
    String? status,
    List<dynamic>? cartItems,
    Object? date,
    String? customerID,
  }) {
    return SellOutOrderModel(
      orderId: orderId ?? this.orderId,
      userID: userID ?? this.userID,
      agent: agent ?? this.agent,
      customerName: customerName ?? this.customerName,
      route: route ?? this.route,
      region: region ?? this.region,
      customerPhoneNumber: customerPhoneNumber ?? this.customerPhoneNumber,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      cartItems: cartItems ?? this.cartItems,
      date: date ?? this.date,
      customerID: customerID ?? this.customerID,
    );
  }

  // toMap
  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'user': userID,
      'agent': agent,
      'customerName': customerName,
      'customerPhoneNumber': customerPhoneNumber,
      'route': route,
      'region': region,
      'total': amount,
      'status': status,
      'items': cartItems,
      'date': date,
      'customerID': customerID,
    };
  }

  factory SellOutOrderModel.fromFireStore(DocumentSnapshot documentSnapshot) {
    var data = documentSnapshot.data() as Map;
    return SellOutOrderModel(
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
      customerID: data["customerID"] ?? "Missing",
    );
  }
}