part of nice_hooks;

class DefectsProvider with ChangeNotifier {
  final last30Days = MyDateUtils.todayMinusDays(30);
  Future<List<DefectModel>> getAllDefects(
      {required String userId, DateTime? lastNumDays}) {
    final ref = FirebaseFirestore.instance
        .collection("NICE_TWO_DEFECTS")
        .where("date", isGreaterThanOrEqualTo: lastNumDays ?? last30Days)
        .where("posted_by", isEqualTo: userId)
        .orderBy("date", descending: true);

    return ref.get().then((docs) =>
        docs.docs.map((doc) => DefectModel.fromFirebase(doc)).toList());
  }

  Future<void> addDefect({required DefectModel defect}) {
    return FirebaseFirestore.instance
        .collection("NICE_TWO_DEFECTS")
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(defect.toMap());
  }
}
