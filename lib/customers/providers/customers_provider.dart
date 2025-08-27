part of nice_hooks;

class CustomersProvider with ChangeNotifier {
  Future<void> registerCustomer({required CustomerModel customer}) {
    return FirebaseFirestore.instance
        .collection('NHOP_WHOLESALERS')
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(customer.toMap());
  }

  Future<List<CustomerModel>> getAllMyRegisteredCustomers(
      {required String phone}) {
    final ref = FirebaseFirestore.instance
        .collection("NHOP_WHOLESALERS")
        .where("registered_by", isEqualTo: phone)
        .orderBy("date", descending: true);

    return ref.get().then((docs) =>
        docs.docs.map((doc) => CustomerModel.fromFirestore(doc)).toList());
  }

  Stream<List<CustomerModel>> getAllMyRegisteredCustomersStream(
      {required String phone}) {
    final ref = FirebaseFirestore.instance
        .collection("NHOP_WHOLESALERS")
        .where("registered_by", isEqualTo: phone)
        .orderBy("name", descending: false);
    // .orderBy("date", descending: true);
    return ref.snapshots().map((docs) =>
        docs.docs.map((doc) => CustomerModel.fromFirestore(doc)).toList());
  }

  Future<List<CustomerModel>> getAllCustomersByAgent({required String agent}) {
    final ref = FirebaseFirestore.instance
        .collection("NHOP_WHOLESALERS")
        .where("agent", isEqualTo: agent)
        .orderBy("name", descending: false);
    return ref.get().then((docs) =>
        docs.docs.map((doc) => CustomerModel.fromFirestore(doc)).toList());
  }

  Stream<List<CustomerModel>> getAllCustomersByAgentStream(
      {required String agent}) {
    final ref = FirebaseFirestore.instance
        .collection("NHOP_WHOLESALERS")
        .where("agent", isEqualTo: agent)
        .orderBy("name", descending: false);
    return ref.snapshots().map((docs) =>
        docs.docs.map((doc) => CustomerModel.fromFirestore(doc)).toList());
  }

  Future<void> updateCustomerGps(
      {required String gpsInfo, required String docID}) {
    return FirebaseFirestore.instance
        .collection("NHOP_WHOLESALERS")
        .doc(docID)
        .update({"gps": gpsInfo});
  }

  Future<void> updateCustomerInfo(
      {required Map<String, Object> customerInfo, required String docId}) {
    return FirebaseFirestore.instance
        .collection("NHOP_WHOLESALERS")
        .doc(docId)
        .update(customerInfo);
  }

  Future<void> updateCustomerInfo2(
      {required CustomerModel customer, required String docId}) {
    return FirebaseFirestore.instance
        .collection("NHOP_WHOLESALERS")
        .doc(docId)
        .update(customer.toMap());
  }

  /// Admin Methods
  Future<void> deleteCustomer(String id) {
    return FirebaseFirestore.instance
        .collection("NHOP_WHOLESALERS")
        .doc(id)
        .delete();
  }

  Future<List<CustomerModel>> getAllRegionCustomers({required String region}) {
    return FirebaseFirestore.instance
        .collection("NHOP_WHOLESALERS")
        .where("region", isEqualTo: region)
        .orderBy("date", descending: true)
        .get()
        .then((docs) =>
            docs.docs.map((doc) => CustomerModel.fromFirestore(doc)).toList());
  }

  Future<List<CustomerModel>> getLast90DaysCustomersRegistered({
    required String region,
    DateTime? lastNumDays,
  }) {
    final last65Days = DateTime.now().subtract(const Duration(days: 65));
    final ref = FirebaseFirestore.instance
        .collection("NHOP_WHOLESALERS")
        .where("region", isEqualTo: region)
        .where("date", isGreaterThanOrEqualTo: lastNumDays ?? last65Days)
        .orderBy("date", descending: true);

    return ref.get().then((docs) =>
        docs.docs.map((doc) => CustomerModel.fromFirestore(doc)).toList());
  }

  

}
