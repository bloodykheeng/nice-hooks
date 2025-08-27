class ChartDataModel {
  final String title;
  final int value;

  ChartDataModel(this.title, this.value);

  @override
  String toString() {
    return "$title, $value";
  }
}
