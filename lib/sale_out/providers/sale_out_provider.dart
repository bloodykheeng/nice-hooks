part of nice_hooks;

class SaleOutProvider with ChangeNotifier {
  Future<List<SaleOutModel>> getAllSaleOutByAgentLast30Days({
    required String uid,
    required String agent,
    required String companyName,
    DateTime? lastNumDays,
  }) {
    final last30Days = MyDateUtils.todayMinusDays(30);
    final ref = FirebaseFirestore.instance
        .collection("${companyName}_TWO_SALES")
        .where("user", isEqualTo: uid)
        .where("agent", isEqualTo: agent)
        .where("date", isGreaterThanOrEqualTo: lastNumDays ?? last30Days)
        .orderBy("date", descending: true);

    return ref.get().then((docs) =>
        docs.docs.map((doc) => SaleOutModel.fromFireStore(doc)).toList());
  }

  Future<void> addSaleOut({
    required SaleOutModel sale,
    required String companyName,
  }) {
    return FirebaseFirestore.instance
        .collection("${companyName}_TWO_SALES")
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(sale.toMap());
  }

// delte saleout
  Future<void> deleteSaleOut({
    required String orderId,
    required String companyName,
  }) {
    return FirebaseFirestore.instance
        .collection("${companyName}_TWO_SALES")
        .doc(orderId)
        .delete();
  }

  Future<List<SaleOutModel>> getSaleOutfromMostRecentMonday({
    required String region,
  }) {
    final _dateToday = DateTime.now();
    final mostRecentMonday = DateTime(_dateToday.year, _dateToday.month,
        _dateToday.day - (_dateToday.weekday - 1));
    return FirebaseFirestore.instance
        .collection("NICE_TWO_SALES")
        .where("region", isEqualTo: region)
        .where("date", isGreaterThanOrEqualTo: mostRecentMonday)
        .orderBy("date", descending: true)
        .get()
        .then((value) =>
            value.docs.map((e) => SaleOutModel.fromFireStore(e)).toList());
  }

  Future<List<SaleOutModel>> getAllAgentSaleoutByUser({
    required String user,
    required String agent,
    required DateTime fromDate,
  }) {
    return FirebaseFirestore.instance
        .collection("NICE_TWO_SALES")
        .where("user", isEqualTo: user)
        .where("date", isGreaterThanOrEqualTo: fromDate)
        .orderBy("date", descending: true)
        .get()
        .then((value) =>
            value.docs.map((e) => SaleOutModel.fromFireStore(e)).toList());
  }

  Future<List<SaleOutModel>> getLastNumDaysSaleOut({
    required String region,
    required DateTime numOfDays,
  }) {
    return FirebaseFirestore.instance
        .collection("NICE_TWO_SALES")
        .where("region", isEqualTo: region)
        .where("date", isGreaterThanOrEqualTo: numOfDays)
        .orderBy("date", descending: true)
        .get()
        .then((value) =>
            value.docs.map((e) => SaleOutModel.fromFireStore(e)).toList());
  }
}
