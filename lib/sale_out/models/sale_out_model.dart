part of nice_hooks;

class SaleOutModel with ChangeNotifier {
  final String orderId;
  final String userID;
  final String agent;
  final String customerName;
  final String route;
  final String region;
  final double amount;
  final List<dynamic> cartItems;
  final Object date;

  SaleOutModel({
    required this.orderId,
    required this.userID,
    required this.agent,
    required this.customerName,
    required this.route,
    required this.region,
    required this.amount,
    required this.cartItems,
    required this.date,
  });

  // toMap
  Map<String, dynamic> toMap() {
    return {
      "orderId": orderId,
      "user": userID,
      "agent": agent,
      "customerName": customerName,
      "route": route,
      "region": region,
      "total": amount,
      "items": cartItems,
      "date": date,
    };
  }

  factory SaleOutModel.fromFireStore(DocumentSnapshot documentSnapshot) {
    var data = documentSnapshot.data() as Map;
    // print(data);
    return SaleOutModel(
      orderId: documentSnapshot.id,
      userID: data["user"],
      agent: data["agent"],
      customerName: data["customerName"],
      route: data["route"],
      region: data["region"] ?? "Missing",
      amount: data["total"],
      cartItems: data["items"],
      date: data["date"].toDate(),
    );
  }
  @override
  String toString() {
    return "ID: $orderId,\n userID: $userID, \n customer:$customerName,\n route:$route \n Total Amount: $amount,\n Date : $date,\n CartItems : $cartItems, ";
  }
}
