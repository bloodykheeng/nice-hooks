
part of nice_hooks;

class Utils {
  static formatMoney(double val) => NumberFormat("UGX ###,000").format(val);
  static formatDate(DateTime date) => DateFormat("dd-MMMM-yyyy").format(date);

  static Future<DateTime> selectDate({
    required BuildContext context,
    required String helpTxt,
    required DateTime firstDate,
    required DateTime lastDate,
  }) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstDate,
      lastDate: lastDate,
      helpText: helpTxt,
    );
    if (picked != null && picked != DateTime.now()) {
      return picked;
    } else {
      return DateTime.now();
    }
  }

    static flutterToast(String msg) => Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
