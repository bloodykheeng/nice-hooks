part of nice_hooks;

class SellOutOrdersProvider with ChangeNotifier {

  Future<List<SellOutOrderModel>> getSaleOutOrdersByAgentLast30Days(
      {required String uid,
      required String companyName,
      required String agent,
      DateTime? lastNumDays}) {
    final last30Days = MyDateUtils.todayMinusDays(30);
    final ref = FirebaseFirestore.instance
        .collection("${companyName}_TWO_ORDERS")
        .where("user", isEqualTo: uid)
        .where("agent", isEqualTo: agent)
        .where("date", isGreaterThanOrEqualTo: lastNumDays ?? last30Days)
        .orderBy("date", descending: true);

    return ref.get().then((docs) =>
        docs.docs.map((doc) => SellOutOrderModel.fromFireStore(doc)).toList());
  }

  Stream<List<SellOutOrderModel>> getSaleOutOrdersByAgentLast30DaysStream(
      {required String uid,
      required String companyName,
      required String agent,
      DateTime? lastNumDays}) {
    final last30Days = MyDateUtils.todayMinusDays(30);
    final ref = FirebaseFirestore.instance
        .collection("${companyName}_TWO_ORDERS")
        .where("user", isEqualTo: uid)
        .where("agent", isEqualTo: agent)
        .where("date", isGreaterThanOrEqualTo: lastNumDays ?? last30Days)
        .orderBy("date", descending: true);

    return ref.snapshots().map((docs) =>
        docs.docs.map((doc) => SellOutOrderModel.fromFireStore(doc)).toList());
  }

  Stream<List<SellOutOrderModel>> getSaleOutOrdersByCustomerId(
      {required String uid,
      required String companyName,
      required String customerId,
      DateTime? lastNumDays}) {
    final last30Days = MyDateUtils.todayMinusDays(30);
    var ref = FirebaseFirestore.instance
        .collection("${companyName}_TWO_ORDERS")
        .where("user", isEqualTo: uid)
        .where("customerID", isEqualTo: customerId)
        .where("status", isEqualTo: "PENDING")
        .where("date", isGreaterThanOrEqualTo: lastNumDays ?? last30Days)
        .orderBy("date", descending: true);

    return ref.snapshots().map((docs) =>
        docs.docs.map((doc) => SellOutOrderModel.fromFireStore(doc)).toList());
  }

  Future<void> addNewSaleOutOrder(
      {required String companyName, required SellOutOrderModel order}) {
    return FirebaseFirestore.instance
        .collection("${companyName}_TWO_ORDERS")
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(order.toMap());
  }

  Future<void> updateOrderStatus(
      {required String orderId,
      required String status,
      required String companyName}) {
    return FirebaseFirestore.instance
        .collection("${companyName}_TWO_ORDERS")
        .doc(orderId)
        .update({"status": status});
  }

  Future<void> deleteSaleoutOrder(String orderId, String companyName) {
    return FirebaseFirestore.instance
        .collection("${companyName}_TWO_ORDERS")
        .doc(orderId)
        .delete();
  }


Future<List<SellOutOrderModel>> getSaleOutOrdersByRegion({
    required String region,
    required DateTime numOfDays,
  }) {
    final ref = FirebaseFirestore.instance
        .collection("NICE_TWO_ORDERS")
        .where("region", isEqualTo: region)
        .where("date", isGreaterThanOrEqualTo: numOfDays)
        .orderBy("date", descending: true);

    return ref.get().then((docs) =>
        docs.docs.map((doc) => SellOutOrderModel.fromFireStore(doc)).toList());
  }

  Future<List<SellOutOrderModel>> getAllAgentSaleoutOrdersByUser({
    required String userID,
    required String agent,
    required DateTime fromDate,
  }) {
    final ref = FirebaseFirestore.instance
        .collection("NICE_TWO_ORDERS")
        .where("user", isEqualTo: userID)
        .where("agent", isEqualTo: agent)
        .where("date", isGreaterThanOrEqualTo: fromDate)
        .orderBy("date", descending: true);
    return ref.get().then((docs) =>
        docs.docs.map((doc) => SellOutOrderModel.fromFireStore(doc)).toList());
  }

  
}
