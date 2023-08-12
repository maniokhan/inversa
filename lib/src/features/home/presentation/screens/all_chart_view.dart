// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// - - - - -- - - Pie Chart - - - - - - - - - - -- - - - -

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
        textStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: ConfigColors.lightText,
        ),
      ),
      tooltipBehavior: _tooltipBehavior,
      series: <CircularSeries>[
        PieSeries<GDPData, String>(
          legendIconType: LegendIconType.circle,
          dataSource: _chartData,
          xValueMapper: (GDPData data, _) => data.continent,
          yValueMapper: (GDPData data, _) => data.gdp,
          dataLabelMapper: (GDPData data, _) => data.text,
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
            textStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ConfigColors.white,
            ),
          ),
          enableTooltip: true,
        )
      ],
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Point 01', 40, '40%'),
      GDPData('Point 02', 50, '50%'),
      GDPData('Point 03', 24, '24%'),
      GDPData('Point 04', 20, '20%'),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(
    this.continent,
    this.gdp,
    this.text,
  );
  final String continent;
  final int gdp;
  final String text;
}

// - - - - - - - - - -  Top Client Chart -- - - - - -- -  -

class TopClientChart extends StatefulWidget {
  const TopClientChart({super.key});

  @override
  State<TopClientChart> createState() => _TopClientChartState();
}

class _TopClientChartState extends State<TopClientChart> {
  List<TopClientChartData>? chartData;

  @override
  void initState() {
    chartData = <TopClientChartData>[
      TopClientChartData('Jan', 10, 6),
      TopClientChartData('Feb', 9, 7),
      TopClientChartData('Mar', 6, 10),
      TopClientChartData('Apr', 10, 6),
      TopClientChartData('May', 9, 6),
      TopClientChartData('Jun', 6, 4),
      TopClientChartData('Jul', 5, 10),
      TopClientChartData('Aug', 6, 4),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      margin: const EdgeInsets.all(0),
      primaryXAxis: CategoryAxis(
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
        majorGridLines: const MajorGridLines(width: 0),
        labelStyle: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: ConfigColors.lightText,
        ),
      ),
      primaryYAxis: NumericAxis(
        isVisible: false,
      ),
      tooltipBehavior: TooltipBehavior(
        enable: true,
        canShowMarker: true,
        header: '',
        format: 'point.y',
        color: ConfigColors.primary,
        textStyle: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: ConfigColors.white,
        ),
        borderColor: ConfigColors.primary,
      ),
      series: _getDefaultAreaSeries(),
    );
  }

  List<ChartSeries<TopClientChartData, String>> _getDefaultAreaSeries() {
    return <ChartSeries<TopClientChartData, String>>[
      SplineAreaSeries<TopClientChartData, String>(
        dataSource: chartData!,
        opacity: 0.5,
        xValueMapper: (TopClientChartData sales, _) => sales.month,
        yValueMapper: (TopClientChartData sales, _) => sales.x,
        color: const Color(0xFF147AD6),
      ),
      SplineAreaSeries<TopClientChartData, String>(
        dataSource: chartData!,
        opacity: 0.5,
        xValueMapper: (TopClientChartData sales, _) => sales.month,
        yValueMapper: (TopClientChartData sales, _) => sales.y,
        color: const Color(0xFFEC6666),
      )
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}

class TopClientChartData {
  TopClientChartData(
    this.month,
    this.x,
    this.y,
  );
  final String month;
  final double x;
  final double y;
}

// - - - - -- - - Profitability Chart - - - - - - - - - - -- - - - -

class ProfitabilityChart extends StatefulWidget {
  const ProfitabilityChart({super.key});

  @override
  State<ProfitabilityChart> createState() => _StackSeriesState();
}

class _StackSeriesState extends State<ProfitabilityChart> {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      margin: const EdgeInsets.all(0),
      primaryXAxis: CategoryAxis(
        labelPosition: ChartDataLabelPosition.inside,
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
        majorGridLines: const MajorGridLines(width: 0),
        labelStyle: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: ConfigColors.lightText,
        ),
      ),
      primaryYAxis: NumericAxis(
        isVisible: false,
      ),
      series: _getSplieAreaSeries(),
      tooltipBehavior: TooltipBehavior(
        enable: true,
        canShowMarker: true,
        header: '',
        format: 'point.y',
        color: ConfigColors.primary,
        textStyle: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: ConfigColors.white,
        ),
        borderColor: ConfigColors.primary,
      ),
    );
  }

  List<ChartSeries<_SplineAreaData, String>> _getSplieAreaSeries() {
    return <ChartSeries<_SplineAreaData, String>>[
      SplineAreaSeries<_SplineAreaData, String>(
        dataSource: <_SplineAreaData>[
          _SplineAreaData('Jan', 4.53),
          _SplineAreaData('Feb', 9.5),
          _SplineAreaData('Mar', 10),
          _SplineAreaData('Apr', 9.4),
          _SplineAreaData("May", 10.8),
          _SplineAreaData("Jun", 4.9),
          _SplineAreaData('Jul', 7.5),
          _SplineAreaData('Aug', 9.6),
          _SplineAreaData('Sep', 3.43),
        ],
        color: ConfigColors.backgroundGreen,
        borderColor: ConfigColors.primary,
        borderWidth: 1,
        xValueMapper: (_SplineAreaData value, _) => value.month,
        yValueMapper: (_SplineAreaData value, _) => value.x,
      ),
    ];
  }
}

class _SplineAreaData {
  _SplineAreaData(this.month, this.x);
  final String month;
  final double x;
}

// - - - - -- - - Sales By Product Chart - - - - - - - - - - -- - - - -

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
      color: Colors.white,
      textStyle: const TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: ConfigColors.black,
      ),
      borderColor: ConfigColors.primary,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      palette: const [
        Color(0xFF2AB0B6),
      ],
      plotAreaBorderWidth: 0,
      tooltipBehavior: _tooltipBehavior,
      primaryXAxis: CategoryAxis(
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
        majorGridLines: const MajorGridLines(width: 0),
        labelStyle: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: ConfigColors.lightText,
        ),
      ),
      margin: const EdgeInsets.all(0),
      primaryYAxis: NumericAxis(
        minimum: 0,
        maximum: 1000,
        isVisible: false,
      ),
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
          ColumnWithTrack("Oct", 730),
        ],
        width: 0.7,
        xValueMapper: (exp, index) => exp.month as String,
        yValueMapper: (exp, index) => exp.sale,
        isTrackVisible: true,
        trackColor: ConfigColors.primary.withOpacity(0.20),
        borderRadius: BorderRadius.circular(8),
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

// - - - - -- - - Sales By Category Chart - - - - - - - - - - -- - - - -

class StatisticBarChart extends StatelessWidget {
  const StatisticBarChart({super.key});

  final betweenSpace = 0.2;
  final blueColor = const Color(0xFF147AD6);
  final tealColor = const Color(0xFF79D2DE);

  BarChartGroupData generateGroupData(
    int x,
    double category1,
    double category2,
  ) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: category1,
          color: blueColor,
          width: 7,
        ),
        BarChartRodData(
          fromY: category1 + betweenSpace,
          toY: category1 + betweenSpace + category2,
          color: tealColor,
          width: 7,
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 10,
      fontWeight: FontWeight.w600,
      color: ConfigColors.lightText,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'JAN';
        break;
      case 1:
        text = 'FEB';
        break;
      case 2:
        text = 'MAR';
        break;
      case 3:
        text = 'APR';
        break;
      case 4:
        text = 'MAY';
        break;
      case 5:
        text = 'JUN';
        break;
      case 6:
        text = 'JUL';
        break;
      case 7:
        text = 'AUG';
        break;
      case 8:
        text = 'SEP';
        break;
      case 9:
        text = 'OCT';
        break;
      case 10:
        text = 'NOV';
        break;
      case 11:
        text = 'DEC';
        break;
      default:
        text = '';
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceBetween,
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(),
            rightTitles: const AxisTitles(),
            topTitles: const AxisTitles(),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: bottomTitles,
              ),
            ),
          ),
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: Colors.white,
              tooltipRoundedRadius: 12,
            ),
          ),
          borderData: FlBorderData(show: false),
          gridData: const FlGridData(show: false),
          barGroups: [
            generateGroupData(0, 2, 3),
            generateGroupData(1, 2, 5),
            generateGroupData(2, 1.3, 3.1),
            generateGroupData(3, 3.1, 4),
            generateGroupData(4, 0.8, 3.3),
            generateGroupData(5, 2, 5.6),
            generateGroupData(6, 1.3, 3.2),
            generateGroupData(7, 2.3, 3.2),
            generateGroupData(8, 2, 4.8),
            generateGroupData(9, 1.2, 3.2),
            generateGroupData(10, 1, 4.8),
            generateGroupData(11, 2, 4.4),
          ],
        ),
      ),
    );
  }
}

// // - - - - -- - - Sale Chart - - - - - - - - - - -- - - - -

// class SalesChart extends StatelessWidget {
//   const SalesChart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return LineChart(
//       LineChartData(
//         lineTouchData: lineTouchData1,
//         gridData: gridData,
//         titlesData: titlesData1,
//         borderData: borderData,
//         lineBarsData: lineBarsData1,
//         minX: 0,
//         maxX: 14,
//         maxY: 4,
//         minY: 0,
//       ),
//     );
//   }

//   LineTouchData get lineTouchData1 => LineTouchData(
//         handleBuiltInTouches: true,
//         touchTooltipData: LineTouchTooltipData(
//           tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
//         ),
//       );

//   FlTitlesData get titlesData1 => FlTitlesData(
//         bottomTitles: AxisTitles(
//           sideTitles: bottomTitles,
//         ),
//         rightTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         topTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         leftTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//       );

//   Widget bottomTitleWidgets(double value, TitleMeta meta) {
//     const style = TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 16,
//     );
//     Widget text;
//     switch (value.toInt()) {
//       case 1:
//         text = const Text('Jan', style: style);
//         break;
//       case 2:
//         text = const Text('Feb', style: style);
//         break;
//       case 3:
//         text = const Text('Mar', style: style);
//         break;

//       case 4:
//         text = const Text('Apr', style: style);
//         break;

//       case 5:
//         text = const Text('May', style: style);
//         break;

//       case 6:
//         text = const Text('Jun', style: style);
//         break;

//       case 7:
//         text = const Text('Jul', style: style);
//         break;
//       default:
//         text = const Text('');
//         break;
//     }

//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       space: 10,
//       child: text,
//     );
//   }

//   SideTitles get bottomTitles => SideTitles(
//         showTitles: true,
//         reservedSize: 32,
//         interval: 1,
//         getTitlesWidget: bottomTitleWidgets,
//       );
//   FlGridData get gridData => const FlGridData(show: false);

//   FlBorderData get borderData => FlBorderData(
//         show: true,
//         border: Border(
//           bottom: BorderSide(
//               color: ConfigColors.primary.withOpacity(0.2), width: 4),
//           left: const BorderSide(color: Colors.transparent),
//           right: const BorderSide(color: Colors.transparent),
//           top: const BorderSide(color: Colors.transparent),
//         ),
//       );

//   LineChartBarData get lineChartBarData1_1 => LineChartBarData(
//         isCurved: true,
//         color: Colors.green,
//         barWidth: 8,
//         isStrokeCapRound: true,
//         dotData: const FlDotData(show: false),
//         belowBarData: BarAreaData(show: false),
//         spots: const [
//           FlSpot(1, 1),
//           FlSpot(3, 1.5),
//           FlSpot(5, 1.4),
//           FlSpot(7, 3.4),
//           FlSpot(10, 2),
//           FlSpot(12, 2.2),
//           FlSpot(13, 1.8),
//         ],
//       );
//   LineChartBarData get lineChartBarData1_2 => LineChartBarData(
//         isCurved: true,
//         color: const Color(0xFF011627),
//         barWidth: 4,
//         isStrokeCapRound: true,
//         dotData: const FlDotData(show: false),
//         belowBarData: BarAreaData(
//           show: false,
//           color: Colors.pink.withOpacity(0),
//         ),
//         spots: const [
//           FlSpot(1, 1),
//           FlSpot(3, 2.8),
//           FlSpot(7, 1.2),
//           FlSpot(10, 2.8),
//           FlSpot(12, 2.6),
//           FlSpot(13, 3.9),
//         ],
//       );

//   List<LineChartBarData> get lineBarsData1 => [
//         lineChartBarData1_1,
//         lineChartBarData1_2,
//       ];
// }
