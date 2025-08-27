part of nice_hooks;


class SellInOrdersProvider with ChangeNotifier {
  final last30Days = MyDateUtils.todayMinusDays(30);

  Future<List<SellInOrderModel>> getAllSaleInOrders({
    required String userID,
    required String agent,
    required String companyName,
    DateTime? lastNumDays,
  }) {
    var ref = FirebaseFirestore.instance
        .collection("${companyName}_TWO_SELL_IN_ORDERS")
        .where("user", isEqualTo: userID)
        .where("agent", isEqualTo: agent)
        .where("date", isGreaterThanOrEqualTo: lastNumDays ?? last30Days)
        .orderBy("date", descending: true);

    return ref.get().then((docs) =>
        docs.docs.map((doc) => SellInOrderModel.fromFireStore(doc)).toList());
  }

  void addSellInOrder({
    required SellInOrderModel sellInOrder,
    required String companyName,
  }) {
    FirebaseFirestore.instance
        .collection("${companyName}_TWO_SELL_IN_ORDERS")
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(sellInOrder.toMap());
  }

  Future<void> deleteSellInOrder({
    required String orderId,
    required String companyName,
  }) {
    return FirebaseFirestore.instance
        .collection("${companyName}_TWO_SELL_IN_ORDERS")
        .doc(orderId)
        .delete();
  }

  double computeSaleInCreatedTotal({
    required List<SellInOrderModel> data,
    required DateTime isAfterDate,
  }) {
    var total = 0.0;
    var filteredData = data.where((element) {
      return (element.date as DateTime).isAfter(isAfterDate);
    }).toList();

    for (var s in filteredData) {
      total += s.amount;
    }
    return total;
  }

  double computeSaleInDispatchedTotal({
    required List<SellInOrderModel> data,
    required DateTime isAfterDate,
  }) {
    var total = 0.0;
    var filteredData = data.where((element) {
      return (element.date as DateTime).isAfter(isAfterDate);
    }).toList();

    for (var s in filteredData) {
      if (s.status == "DISPATCHED") {
        total += s.dispatchedTotal;
      }
    }
    return total;
  }
}
