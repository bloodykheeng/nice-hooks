
part of nice_hooks;

class SfPieChart extends StatefulWidget {
  final List<ChartDataModel> chartData;
  final String title;
  final Function(ChartPointDetails chartPoint)? onTap;
  final Function(ChartPointDetails chartPoint)? onLongTap;
  const SfPieChart({
    Key? key,
    required this.chartData,
    required this.title,
    this.onTap,
    this.onLongTap,
  }) : super(key: key);

  @override
  State<SfPieChart> createState() => _SfPieChartState();
}

class _SfPieChartState extends State<SfPieChart> {

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
          width: double.infinity,
          height: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.share,
                    color: Colors.teal,
                  )),
              Expanded(
                child: SfCircularChart(
                  title: ChartTitle(
                      text: widget.title,
                      textStyle: Theme.of(context).textTheme.headline6),
                  legend: Legend(
                    isVisible: true,
                    overflowMode: LegendItemOverflowMode.wrap,
                    position: LegendPosition.bottom,
                  ),
                  tooltipBehavior: TooltipBehavior(
                      enable: true,
                      builder: (dynamic data, dynamic point, dynamic series,
                          int pointIndex, int seriesIndex) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              data.toString(),
                              style: const TextStyle(color: Colors.white),
                            ));
                      }),
                  series: <CircularSeries>[
                    PieSeries<ChartDataModel, String>(
                      onPointTap: widget.onTap,
                      onPointLongPress: widget.onTap,
                      dataSource: widget.chartData,
                      explode: true,
                      explodeOffset: '20%',
                      xValueMapper: (ChartDataModel data, _) => data.title,
                      yValueMapper: (ChartDataModel data, _) => data.value,
                      dataLabelMapper: (ChartDataModel data, _) => data.title,
                      enableTooltip: true,
                      dataLabelSettings: const DataLabelSettings(
                        showZeroValue: false,
                        isVisible: true,
                        labelPosition: ChartDataLabelPosition.outside,
                        useSeriesColor: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
