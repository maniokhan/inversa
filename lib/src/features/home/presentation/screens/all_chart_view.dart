import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatefulWidget {
  const PieChart({super.key});

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      palette: const [
        Color(0xff147AD6),
        Color(0xff79D2DE),
        Color(0xffFFAB7C),
        Color(0xffFF7B9A),
      ],
      legend: const Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        alignment: ChartAlignment.center,
        position: LegendPosition.bottom,
        padding: 4,
      ),
      tooltipBehavior: _tooltipBehavior,
      series: <CircularSeries>[
        PieSeries<GDPData, String>(
          legendIconType: LegendIconType.circle,
          dataSource: _chartData,
          xValueMapper: (GDPData data, _) => data.continent,
          yValueMapper: (GDPData data, _) => data.gdp,
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          enableTooltip: true,
        )
      ],
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Point 01', 40),
      GDPData('Point 02', 50),
      GDPData('Point 03', 24),
      GDPData('Point 04', 20),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}

class StackSeries extends StatefulWidget {
  const StackSeries({super.key});

  @override
  State<StackSeries> createState() => _StackSeriesState();
}

class _StackSeriesState extends State<StackSeries> {
  late List<_SplineAreaData> chartData;

  @override
  void initState() {
    chartData = <_SplineAreaData>[
      _SplineAreaData(2010, 10.53, 3.3),
      _SplineAreaData(2011, 9.5, 5.4),
      _SplineAreaData(2012, 10, 2.65),
      _SplineAreaData(2013, 9.4, 2.62),
      _SplineAreaData(2014, 5.8, 1.99),
      _SplineAreaData(2015, 4.9, 1.44),
      _SplineAreaData(2016, 4.5, 2),
      _SplineAreaData(2017, 3.6, 1.56),
      _SplineAreaData(2018, 3.43, 2.1),
    ];
    super.initState();
  }

  @override
  void dispose() {
    chartData.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      // legend: const Legend(isVisible: true, opacity: 0.7),
      title: ChartTitle(text: 'Inflation rate'),
      plotAreaBorderWidth: 0,
      primaryXAxis: NumericAxis(
          interval: 1,
          majorGridLines: const MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}%',
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getSplieAreaSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<ChartSeries<_SplineAreaData, double>> _getSplieAreaSeries() {
    return <ChartSeries<_SplineAreaData, double>>[
      SplineAreaSeries<_SplineAreaData, double>(
        dataSource: chartData,
        color: const Color.fromRGBO(75, 135, 185, 0.6),
        borderColor: const Color.fromRGBO(75, 135, 185, 1),
        borderWidth: 2,
        name: 'India',
        xValueMapper: (_SplineAreaData sales, _) => sales.year,
        yValueMapper: (_SplineAreaData sales, _) => sales.y1,
      ),
      SplineAreaSeries<_SplineAreaData, double>(
        dataSource: chartData,
        borderColor: const Color.fromRGBO(192, 108, 132, 1),
        color: const Color.fromRGBO(192, 108, 132, 0.6),
        borderWidth: 2,
        name: 'China',
        xValueMapper: (_SplineAreaData sales, _) => sales.year,
        yValueMapper: (_SplineAreaData sales, _) => sales.y2,
      )
    ];
  }
}

class _SplineAreaData {
  _SplineAreaData(this.year, this.y1, this.y2);
  final double year;
  final double y1;
  final double y2;
}

class ColumnTrack extends StatefulWidget {
  const ColumnTrack({super.key});

  @override
  State<ColumnTrack> createState() => _ColumnWithTrackState();
}

class _ColumnWithTrackState extends State<ColumnTrack> {
  TooltipBehavior? _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      canShowMarker: false,
      header: '',
      format: 'point.y',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      palette: const [
        Color(0xFF2AB0B6),
      ],
      tooltipBehavior: _tooltipBehavior,
      primaryXAxis:
          CategoryAxis(majorGridLines: const MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 1000,
          axisLine: const AxisLine(width: 0),
          majorGridLines: const MajorGridLines(width: 0),
          majorTickLines: const MajorTickLines(size: 0)),
      series: getChartData(),
    );
  }

  List<ColumnSeries<ColumnWithTrack, String>> getChartData() {
    return <ColumnSeries<ColumnWithTrack, String>>[
      ColumnSeries(
        dataSource: <ColumnWithTrack>[
          ColumnWithTrack('Jan', 500),
          ColumnWithTrack('Feb', 550),
          ColumnWithTrack("Mar", 600),
          ColumnWithTrack("Apr", 520),
          ColumnWithTrack("May", 580),
          ColumnWithTrack("Jun", 650),
          ColumnWithTrack("Jul", 700),
          ColumnWithTrack("Aug", 630),
          ColumnWithTrack("Sep", 610),
        ],
        xValueMapper: (exp, index) => exp.month as String,
        yValueMapper: (exp, index) => exp.sale,
        isTrackVisible: true,
        trackColor: Colors.green.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
    ];
  }
}

class ColumnWithTrack {
  ColumnWithTrack(
    this.month,
    this.sale,
  );
  final dynamic month;
  final num sale;
}
