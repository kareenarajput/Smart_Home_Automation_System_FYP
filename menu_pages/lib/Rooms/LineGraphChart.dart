import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineGraphChart extends StatelessWidget {
  final List<TimeSeriesSalesData> energyData = [
    TimeSeriesSalesData(DateTime(2023, 6, 5), 100),
    TimeSeriesSalesData(DateTime(2023, 6, 6), 120),
    TimeSeriesSalesData(DateTime(2023, 6, 7), 115),
    TimeSeriesSalesData(DateTime(2023, 6, 8), 130),
    TimeSeriesSalesData(DateTime(2023, 6, 9), 110),
    TimeSeriesSalesData(DateTime(2023, 6, 10), 145),
    TimeSeriesSalesData(DateTime(2023, 6, 11), 145),
  ];

  LineGraphChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Text(
              'Graphs',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {},
                  child: const Text('Day', style: TextStyle(color: Colors.white)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {},
                    child: const Text('Week', style: TextStyle(color: Colors.white)),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {},
                  child: const Text('Month', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SfCartesianChart(
              primaryXAxis: const CategoryAxis(),
              title: const ChartTitle(text: 'Energy Consumption Graph'),
              legend: const Legend(isVisible: true),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <SplineSeries<TimeSeriesSalesData, String>>[
                SplineSeries<TimeSeriesSalesData, String>(
                  dataSource: energyData,
                  xValueMapper: (TimeSeriesSalesData salesData, _) =>
                      salesData.time.weekday.toString(),
                  yValueMapper: (TimeSeriesSalesData salesData, _) => salesData.energy,
                  name: "Energy Consumption",
                  markerSettings: const MarkerSettings(isVisible: true),
                  color: Colors.blue,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TimeSeriesSalesData {
  final DateTime time;
  final double energy;
  TimeSeriesSalesData(this.time, this.energy);
}
