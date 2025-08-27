
part of nice_hooks;


class SfDonutChart extends StatefulWidget {
  final List<ChartDataModel> chartData;
  final String title;
  const SfDonutChart({Key? key, required this.chartData, required this.title})
      : super(key: key);

  @override
  State<SfDonutChart> createState() => _SfDonutChartState();
}

class _SfDonutChartState extends State<SfDonutChart> {
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
        width: double.infinity,
        height: 400,
        child: SfCircularChart(
          title: ChartTitle(text: widget.title),
          // legend: Legend(
          //     isVisible: true,
          //     overflowMode: LegendItemOverflowMode.wrap,
          //     position: LegendPosition.bottom),
          tooltipBehavior: tooltipBehavior,
          series: <CircularSeries>[
            DoughnutSeries<ChartDataModel, String>(
              dataSource: widget.chartData,
              explode: true,
              explodeOffset: '10%',
              xValueMapper: (ChartDataModel data, _) => data.title,
              yValueMapper: (ChartDataModel data, _) => data.value,
              dataLabelMapper: (ChartDataModel data, _) => data.title,
              enableTooltip: true,
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                labelPosition: ChartDataLabelPosition.inside,
                connectorLineSettings: ConnectorLineSettings(
                  color: Colors.white,
                  width: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
