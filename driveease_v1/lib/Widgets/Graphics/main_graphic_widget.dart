import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphicMain extends StatefulWidget {
  const GraphicMain({super.key});

  @override
  State<GraphicMain> createState() => _GraphicMainState();
}

class _GraphicMainState extends State<GraphicMain> {
  List<Color> gradientColors = [
    Colors.pink,
    Colors.orange,
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 150,
      width: 300,
      child: Stack(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 3,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 18,
                left: 12,
                top: 24,
                bottom: 12,
              ),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget legendaHorizontal(double mes, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (mes.toInt()) {
      case 1:
        text = const Text('FEV', style: style);
        break;
      case 4:
        text = const Text('MAI', style: style);
        break;
      case 7:
        text = const Text('AGO', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget legendaVertical(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '1K';
        break;
      case 3:
        text = '3k';
        break;
      case 5:
        text = '5k';
        break;
      default:
        text = '';
        break;
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      backgroundColor: Colors.blue.shade100,
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.blue,
            strokeWidth: 0.3,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.blue,
            strokeWidth: 0.3,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: legendaHorizontal,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: legendaVertical,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color.fromARGB(255, 0, 40, 73)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 1.9),
            FlSpot(1, 2),
            FlSpot(2, 2),
            FlSpot(3, 2),
            FlSpot(4, 5),
            FlSpot(5, 1.9),
            FlSpot(6, 3.1),
            FlSpot(7, 1.9),
            FlSpot(8, 4.1),
            FlSpot(9, 3.7),
            FlSpot(10, 1.9),
            FlSpot(11, 4.7),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
