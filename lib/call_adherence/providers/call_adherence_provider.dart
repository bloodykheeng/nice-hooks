part of nice_hooks;

class CallAdherenceProvider with ChangeNotifier {
  final last30Days = MyDateUtils.todayMinusDays(30);

  Future<List<CallAdherenceModel>> getAllCallsByUser(
      {required String userId, DateTime? lastNumDays}) {
    final ref = FirebaseFirestore.instance
        .collection("NICE_TWO_CALL_ADHERENCE")
        .where("caller_id", isEqualTo: userId)
        .where("date", isGreaterThanOrEqualTo: lastNumDays ?? last30Days)
        .orderBy("date", descending: true);

    return ref.get().then((docs) =>
        docs.docs.map((doc) => CallAdherenceModel.fromFireStore(doc)).toList());
  }

  Future<void> recordCallAdherence({required CallAdherenceModel call}) {
    final ref =
        FirebaseFirestore.instance.collection("NICE_TWO_CALL_ADHERENCE");
    return ref
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(call.toMap());
  }

  int computeCallsAdherence({
    required List<CallAdherenceModel> data,
    required DateTime isAfterDate,
  }) {
    Set<String> uniqueContacts = {};
    var filteredData = data.where((element) {
      return (element.date as DateTime).isAfter(isAfterDate);
    }).toList();

    for (var i in filteredData) {
      uniqueContacts.add(i.customerPhone);
    }

    return uniqueContacts.length;
  }
}
