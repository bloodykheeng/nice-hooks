
part of nice_hooks;

class SfLineChart extends StatefulWidget {
  final List<ChartDataModel> chartData;
  final String title;
  final String axisTitle;
  final double height;
  final bool isInverted;
  const SfLineChart({
    Key? key,
    required this.chartData,
    required this.title,
    required this.axisTitle,
    required this.height,
    this.isInverted = false,
  }) : super(key: key);

  @override
  State<SfLineChart> createState() => _SfLineChartState();
}

class _SfLineChartState extends State<SfLineChart> {
  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    super.initState();
    tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: widget.height,
        child: SfCartesianChart(
          // enableAxisAnimation: true,
          title: ChartTitle(text: widget.title),
          tooltipBehavior: tooltipBehavior,
          series: <ChartSeries>[
            LineSeries<ChartDataModel, String>(
              name: "",
              color: Colors.tealAccent,
              dataSource: widget.chartData,
              xValueMapper: (ChartDataModel data, _) => data.title,
              yValueMapper: (ChartDataModel data, _) => data.value,
              dataLabelMapper: (ChartDataModel data, _) =>
                  data.value.toString(),
              enableTooltip: true,
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                labelPosition: ChartDataLabelPosition.outside,
                connectorLineSettings:
                    ConnectorLineSettings(color: Colors.white, width: 1),
              ),
            ),
          ],
          primaryXAxis: CategoryAxis(
            labelPosition: ChartDataLabelPosition.outside,
            labelStyle: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),
          ),
          primaryYAxis: NumericAxis(
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            numberFormat:
                NumberFormat.simpleCurrency(name: "", decimalDigits: 0),
            title: AxisTitle(text: widget.axisTitle),
          ),
        ),
      ),
    );
  }
}
