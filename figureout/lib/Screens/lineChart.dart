// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class LineChartScreen extends StatefulWidget {
//   const LineChartScreen({super.key});

//   @override
//   State<LineChartScreen> createState() => _LineChartScreenState();
// }

// class _LineChartScreenState extends State<LineChartScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Line Chart"),),
//       body: SafeArea(child: ListView(children: [
//         LineChart(
//           LineChartData(
//             minX: 100,
//             maxY: 100,
//             lineBarsData: [
//               LineChartBarData(
//                 spots: [],
//                 color: Colors.blueAccent,
//                 barWidth: 6,
//                 isCurved: false,
                
//               )
//             ],
//             titlesData: FlTitlesData(
//               topTitles: AxisTitles(
//                 sideTitles: SideTitles(showTitles: false)
//               ),
//               rightTitles: AxisTitles( sideTitles: SideTitles(showTitles: false)),
//               leftTitles: AxisTitles(axisNameWidget: Text("Data Random")),

//             ),
            
//           )
//         )
//       ],)),
//     );
//   }
// }
