// class SellInOrderModel {
//   final String orderId;
//   final String userID;
//   final String agent;
//   final String customerName;
//   final String route;
//   final String region;
//   final String customerPhoneNumber;
//   final double amount;
//   final String status;
//   final List<dynamic> cartItems;
//   final Object date;
//   // New Variables to make it a SaleInOrderModel
//   final double receivedTotal;
//   final double dispatchedTotal;
//   final String dispatchedBy;
//   final String driverName;
//   final String driverPhoneNumber;
//   final String truckNumber;
//   final String invoiceNumber;

//   SellInOrderModel({
//     required this.orderId,
//     required this.userID,
//     required this.agent,
//     required this.customerName,
//     required this.customerPhoneNumber,
//     required this.route,
//     required this.region,
//     required this.amount,
//     required this.status,
//     required this.cartItems,
//     required this.date,
//     required this.receivedTotal,
//     required this.dispatchedTotal,
//     required this.dispatchedBy,
//     required this.driverName,
//     required this.driverPhoneNumber,
//     required this.truckNumber,
//     required this.invoiceNumber,
//   });

//   // factory SellInOrderModel.fromFireStore(DocumentSnapshot documentSnapshot) {
//   //   var data = documentSnapshot.data() as Map;
//   //   // print(data);
//   //   return SellInOrderModel(
//   //     orderId: documentSnapshot.id,
//   //     userID: data["user"],
//   //     agent: data["agent"],
//   //     customerName: data["customerName"],
//   //     customerPhoneNumber: data["customerPhoneNumber"],
//   //     route: data["route"],
//   //     region: data["region"] ?? "Missing",
//   //     amount: data["total"],
//   //     status: data["status"],
//   //     cartItems: data["items"],
//   //     date: data["date"].toDate(),
//   //     receivedTotal: data["received_total"].toDouble(),
//   //     dispatchedTotal: data["dispatched_total"].toDouble(),
//   //     dispatchedBy: data["dispatched_by"],
//   //     driverName: data["driverName"],
//   //     driverPhoneNumber: data["driverPhoneNumber"],
//   //     truckNumber: data["truckNumber"],
//   //     invoiceNumber: data["invoiceNumber"],
//   //   );
//   // }
//   // // @override
//   // // String toString() {
//   // //   return "ID: $orderId,\n userID: $userID, \n customer:$customerName,\n route:$route \n Total Amount: $amount,\n Date : $date,\n CartItems : $cartItems, ";
//   // // }
// }
