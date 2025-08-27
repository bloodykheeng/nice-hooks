// ignore_for_file: duplicate_import

part of nice_hooks;

class SfBarChart extends StatefulWidget {
  final List<ChartDataModel> chartData;
  final String title;
  final String axisTitle;
  final double height;
  final bool isInverted;
  final Color? bgColor;
  final Color? barColor;
  final Color? xlabColor;
  final Function(ChartPointDetails chartPoint)? onPointClick;
  final Function(ChartPointDetails chartPoint)? onDoubleClick;
  const SfBarChart({
    Key? key,
    required this.chartData,
    required this.title,
    required this.axisTitle,
    required this.height,
    this.isInverted = false,
    this.onPointClick,
    this.onDoubleClick,
    this.bgColor = Colors.teal,
    this.barColor = Colors.tealAccent,
    this.xlabColor = Colors.white,
  }) : super(key: key);

  @override
  State<SfBarChart> createState() => _SfBarChartState();
}

class _SfBarChartState extends State<SfBarChart> {
  late TooltipBehavior tooltipBehavior;
  _SfBarChartState();
  final GlobalKey<SfCartesianChartState> _chartKey = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat("#,##0.0");
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(onPressed: _renderImage, icon: const Icon(Icons.share))
            ],
          ),
          Card(
            elevation: 5,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: widget.height,
              child: SfCartesianChart(
                backgroundColor: widget.bgColor,
                key: _chartKey,
                title: ChartTitle(text: widget.title),
                isTransposed: widget.isInverted,
                // legend: Legend(
                //   isVisible: true,
                //   overflowMode: LegendItemOverflowMode.wrap,
                //   position: LegendPosition.bottom,
                // ),
                tooltipBehavior: tooltipBehavior,
                series: <ChartSeries>[
                  BarSeries<ChartDataModel, String>(
                    name: "",
                    color: widget.barColor,
                    dataSource: widget.chartData,
                    xValueMapper: (ChartDataModel data, _) => data.title,
                    yValueMapper: (ChartDataModel data, _) => data.value,
                    dataLabelMapper: (ChartDataModel data, _) =>
                        numberFormat.format(data.value),
                    enableTooltip: true,
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      labelPosition: ChartDataLabelPosition.outside,
                      connectorLineSettings: ConnectorLineSettings(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    onPointTap: widget.onPointClick,
                    onPointDoubleTap: widget.onDoubleClick,
                  ),
                ],
                primaryXAxis: CategoryAxis(
                  labelPosition: ChartDataLabelPosition.outside,
                  // labelRotation: 20,
                  maximumLabelWidth: 50,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: widget.xlabColor,
                    // isInversed: true,
                  ),
                ),
                primaryYAxis: NumericAxis(
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  numberFormat: NumberFormat.simpleCurrency(
                    name: "",
                    decimalDigits: 0,
                  ),
                  title: AxisTitle(text: widget.axisTitle),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _renderImage() async {
    final List<int> bytes = await _readImageData();
    final Directory documentDirectory =
        await getApplicationDocumentsDirectory();
    final String path = documentDirectory.path;
    const String imageName = 'cartesianchart.png';
    imageCache.clear();
    final File file = File('$path/$imageName');
    file.writeAsBytesSync(bytes);
    await Navigator.of(context).push<dynamic>(
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () =>
                        Share.shareFiles([(file.path)], text: "Graphs"),
                    icon: const Icon(Icons.share)),
              ],
            ),
            body: Center(
              child: Container(
                color: Colors.white,
                child: Image.file(file),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<List<int>> _readImageData() async {
    final dart_ui.Image data =
        await _chartKey.currentState!.toImage(pixelRatio: 3.0);
    final ByteData? bytes =
        await data.toByteData(format: dart_ui.ImageByteFormat.png);
    return bytes!.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  }
}
