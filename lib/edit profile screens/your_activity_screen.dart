// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// class YourActivityScreen extends StatefulWidget {
//   const YourActivityScreen({super.key});

//   @override
//   State<YourActivityScreen> createState() => _YourActivityScreenState();
// }

// class _YourActivityScreenState extends State<YourActivityScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(right: 10.0),
//               child: Image.asset(
//                 "images/ai.png",
//               ),
//             ),
//             const SizedBox(width: 50),
//             Image.asset(
//               "images/your activity.png",
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const Text(
//               'Your activity',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             const Text(
//               'Low',
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                   color: Color(0xFFF44336)),
//             ),

//             // Curved Line Chart
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: 150,
//                 child: LineChart(
//                   LineChartData(
//                     titlesData: const FlTitlesData(
//                       leftTitles: AxisTitles(
//                         sideTitles: SideTitles(showTitles: true),
//                       ),
//                       bottomTitles: AxisTitles(
//                         sideTitles: SideTitles(showTitles: true),
//                       ),
//                     ),
//                     gridData: const FlGridData(show: true),
//                     borderData: FlBorderData(
//                       show: true,
//                       border:
//                           Border.all(color: const Color(0xff37434d), width: 1),
//                     ),
//                     minX: 0,
//                     maxX: 6,
//                     minY: 0,
//                     maxY: 100,
//                     lineBarsData: [
//                       LineChartBarData(
//                         spots: [
//                           const FlSpot(0, 20),
//                           const FlSpot(1, 50),
//                           const FlSpot(2, 10),
//                           const FlSpot(3, 70),
//                           const FlSpot(4, 80),
//                           const FlSpot(5, 40),
//                           const FlSpot(6, 100),
//                         ],
//                         isCurved: true,
//                         color: Colors.red,
//                         barWidth: 4,
//                         isStrokeCapRound: true,
//                         belowBarData: BarAreaData(show: false),
//                         dotData: const FlDotData(show: true),
//                       ),
//                     ],
//                     lineTouchData: LineTouchData(
//                       touchTooltipData: LineTouchTooltipData(
//                         getTooltipItems: (List<LineBarSpot> touchedSpots) {
//                           return touchedSpots.map((spot) {
//                             return LineTooltipItem(
//                               'X: ${spot.x}\nY: ${spot.y}',
//                               const TextStyle(color: Colors.white),
//                             );
//                           }).toList();
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             // Padding(
//             //   padding:
//             //       const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
//             //   child: SizedBox(
//             //     width: MediaQuery.of(context).size.width,
//             //     height: 150,
//             //     child: LineChart(
//             //       LineChartData(
//             //         titlesData: const FlTitlesData(
//             //           leftTitles: AxisTitles(
//             //             sideTitles: SideTitles(showTitles: true),
//             //           ),
//             //           bottomTitles: AxisTitles(
//             //             sideTitles: SideTitles(showTitles: true),
//             //           ),
//             //         ),
//             //         gridData: const FlGridData(show: true),
//             //         borderData: FlBorderData(
//             //           show: true,
//             //           border:
//             //               Border.all(color: const Color(0xff37434d), width: 1),
//             //         ),
//             //         minX: 0,
//             //         maxX: 6,
//             //         minY: 0,
//             //         maxY: 100,
//             //         lineBarsData: [
//             //           LineChartBarData(
//             //             spots: [
//             //               const FlSpot(0, 20),
//             //               const FlSpot(1, 50),
//             //               const FlSpot(2, 10),
//             //               const FlSpot(3, 70),
//             //               const FlSpot(4, 80),
//             //               const FlSpot(5, 40),
//             //               const FlSpot(6, 100),
//             //             ],
//             //             isCurved: true, // Set to true for a curved line
//             //             color: Colors.red,
//             //             barWidth: 4,
//             //             isStrokeCapRound: true,
//             //             belowBarData: BarAreaData(show: false),
//             //             dotData: const FlDotData(
//             //                 show: true), // Optional: Show dots on the line
//             //           ),
//             //         ],
//             //       ),
//             //     ),
//             //   ),
//             // ),
//             // Rest of your existing code (cards and buttons)
//             const Text(
//               "Increase your activity instantly",
//               style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: 120,
//                 child: DecoratedBox(
//                   decoration: BoxDecoration(
//                     color: Colors.transparent,
//                     border: Border.all(
//                       color: const Color(0xFF3628DD), // Border color
//                       width: 2.0, // Border width
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     children: [
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 15.0,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             CircleAvatar(
//                               backgroundColor: const Color(0xFF958CFA),
//                               child: Image.asset("images/video icon.png"),
//                             ),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                             const Text(
//                               "Your free credits are just a quick video away!",
//                               style: TextStyle(
//                                   fontSize: 13, fontWeight: FontWeight.w400),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         width: 200,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             // Navigator.push(
//                             //   context,
//                             //   MaterialPageRoute(builder: (context) => const StandardPlan()),
//                             // );
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF3628DD),
//                             padding: const EdgeInsets.symmetric(vertical: 15.0),
//                             textStyle: const TextStyle(fontSize: 18),
//                           ),
//                           child: const Text(
//                             'Get 10 free credits',
//                             style: TextStyle(
//                                 color: Color(0xFFFFFFFF),
//                                 fontSize: 11,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             // Additional Padding and DecoratedBox for other activities...
//             // (You can keep your existing code for activities below this point)
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: 120,
//                 child: DecoratedBox(
//                   decoration: BoxDecoration(
//                     color: Colors.transparent,
//                     border: Border.all(
//                       color: const Color(0xFF3628DD), // Border color
//                       width:
//                           2.0, // Border width (increase this to make it thicker)
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     children: [
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 15.0,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             CircleAvatar(
//                               backgroundColor: const Color(0xFF958CFA),
//                               child: Image.asset("images/activity image.png"),
//                             ),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                             const Text(
//                               "Move to the top and get seen by more people!",
//                               style: TextStyle(
//                                   fontSize: 13, fontWeight: FontWeight.w400),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         width: 200,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             // Navigator.push(
//                             //   context,
//                             //   MaterialPageRoute(builder: (context) => const StandardPlan()),
//                             // );
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF3628DD),
//                             padding: const EdgeInsets.symmetric(vertical: 15.0),
//                             textStyle: const TextStyle(fontSize: 18),
//                           ),
//                           child: const Text(
//                             'Move up',
//                             style: TextStyle(
//                                 color: Color(0xFFFFFFFF),
//                                 fontSize: 11,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: 120,
//                 child: DecoratedBox(
//                   decoration: BoxDecoration(
//                     color: Colors.transparent,
//                     border: Border.all(
//                       color: const Color(0xFF3628DD), // Border color
//                       width:
//                           2.0, // Border width (increase this to make it thicker)
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     children: [
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 15.0,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             CircleAvatar(
//                               backgroundColor: const Color(0xFF958CFA),
//                               child: Image.asset("images/activity image.png"),
//                             ),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                             const Text(
//                               "Appear more when people are swiping!",
//                               style: TextStyle(
//                                   fontSize: 13, fontWeight: FontWeight.w400),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         width: 200,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             // Navigator.push(
//                             //   context,
//                             //   MaterialPageRoute(builder: (context) => const StandardPlan()),
//                             // );
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF3628DD),
//                             padding: const EdgeInsets.symmetric(vertical: 15.0),
//                             textStyle: const TextStyle(fontSize: 18),
//                           ),
//                           child: const Text(
//                             'Add extra shows',
//                             style: TextStyle(
//                                 color: Color(0xFFFFFFFF),
//                                 fontSize: 11,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: 120,
//                 child: DecoratedBox(
//                   decoration: BoxDecoration(
//                     color: Colors.transparent,
//                     border: Border.all(
//                       color: const Color(0xFF3628DD), // Border color
//                       width:
//                           2.0, // Border width (increase this to make it thicker)
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     children: [
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 15.0,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             CircleAvatar(
//                               backgroundColor: const Color(0xFF958CFA),
//                               child: Image.asset("images/activity image.png"),
//                             ),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                             const Text(
//                               "Tell everyone you’re online and ready to chat!",
//                               style: TextStyle(
//                                   fontSize: 13, fontWeight: FontWeight.w400),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         width: 200,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             // Navigator.push(
//                             //   context,
//                             //   MaterialPageRoute(builder: (context) => const StandardPlan()),
//                             // );
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF3628DD),
//                             padding: const EdgeInsets.symmetric(vertical: 15.0),
//                             textStyle: const TextStyle(fontSize: 18),
//                           ),
//                           child: const Text(
//                             'Show i’m online',
//                             style: TextStyle(
//                                 color: Color(0xFFFFFFFF),
//                                 fontSize: 11,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// class YourActivityScreen extends StatefulWidget {
//   const YourActivityScreen({super.key});

//   @override
//   State<YourActivityScreen> createState() => _YourActivityScreenState();
// }

// class _YourActivityScreenState extends State<YourActivityScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(right: 10.0),
//               child: Image.asset(
//                 "images/ai.png",
//               ),
//             ),
//             const SizedBox(width: 50),
//             Image.asset(
//               "images/your activity.png",
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const Text(
//               'Your activity',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             const Text(
//               'Low',
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                   color: Color(0xFFF44336)),
//             ),

//             // Curved Line Chart
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: 150,
//                 child: LineChart(
//                   LineChartData(
//                     titlesData: const FlTitlesData(
//                       leftTitles: AxisTitles(
//                         sideTitles: SideTitles(showTitles: true),
//                       ),
//                       bottomTitles: AxisTitles(
//                         sideTitles: SideTitles(showTitles: true),
//                       ),
//                     ),
//                     gridData: const FlGridData(show: true),
//                     borderData: FlBorderData(
//                       show: true,
//                       border: Border.all(color: const Color(0xff37434d), width: 1),
//                     ),
//                     minX: 0,
//                     maxX: 6,
//                     minY: 0,
//                     maxY: 100,
//                     lineBarsData: [
//                       LineChartBarData(
//                         spots: [
//                           const FlSpot(0, 20),
//                           const FlSpot(1, 50),
//                           const FlSpot(2, 10),
//                           const FlSpot(3, 70),
//                           const FlSpot(4, 80),
//                           const FlSpot(5, 40),
//                           const FlSpot(6, 100),
//                         ],
//                         isCurved: true,
//                         color: Colors.red,
//                         barWidth: 4,
//                         isStrokeCapRound: true,
//                         belowBarData: BarAreaData(show: false),
//                         dotData: const FlDotData(show: true),
//                       ),
//                     ],
//                     lineTouchData: LineTouchData(
//                       touchTooltipData: LineTouchTooltipData(
//                         getTooltipItems: (List<LineBarSpot> touchedSpots) {
//                           return touchedSpots.map((spot) {
//                             return LineTooltipItem(
//                               'X: ${spot.x}\nY: ${spot.y}',
//                               const TextStyle(color: Colors.white),
//                             );
//                           }).toList();
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             // Legend
//             Padding(
//               padding: const EdgeInsets.only(left: 12.0),
//               child: Row(
//                 children: [
//                   // Date
//                   const SizedBox(
//                     child: Text(
//                       'Oct 18',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   const SizedBox(width: 20),
//                   // Legend items
//                   _buildLegendItem(Colors.red, 'New Contacts'),
//                   const SizedBox(width: 20),
//                   _buildLegendItem(Colors.green, 'New Visitors'),
//                   const SizedBox(width: 20),
//                   _buildLegendItem(Colors.orange, 'New Likes'),
//                 ],
//               ),
//             ),

//             const Text(
//               "Increase your activity instantly",
//               style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: 120,
//                 child: DecoratedBox(
//                   decoration: BoxDecoration(
//                     color: Colors.transparent,
//                     border: Border.all(
//                       color: const Color(0xFF3628DD), // Border color
//                       width: 2.0, // Border width
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 20),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             CircleAvatar(
//                               backgroundColor: const Color(0xFF958CFA),
//                               child: Image.asset("images/video icon.png"),
//                             ),
//                             const SizedBox(width: 20),
//                             const Text(
//                               "Your free credits are just a quick video away!",
//                               style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         width: 200,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             // Navigator.push(
//                             //   context,
//                             //   MaterialPageRoute(builder: (context) => const StandardPlan()),
//                             // );
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF3628DD),
//                             padding: const EdgeInsets.symmetric(vertical: 15.0),
//                             textStyle: const TextStyle(fontSize: 18),
//                           ),
//                           child: const Text(
//                             'Get 10 free credits',
//                             style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 11, fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             // Additional Padding and DecoratedBox for other activities...
//             // (You can keep your existing code for activities below this point)
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: 120,
//                 child: DecoratedBox(
//                   decoration: BoxDecoration(
//                     color: Colors.transparent,
//                     border: Border.all(
//                       color: const Color(0xFF3628DD), // Border color
//                       width: 2.0, // Border width (increase this to make it thicker)
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 20),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             CircleAvatar(
//                               backgroundColor: const Color(0xFF958CFA),
//                               child: Image.asset("images/activity image.png"),
//                             ),
//                             const SizedBox(width: 20),
//                             const Text(
//                               "Move to the top and get seen by more people!",
//                               style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         width: 200,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             // Navigator.push(
//                             //   context,
//                             //   MaterialPageRoute(builder: (context) => const StandardPlan()),
//                             // );
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF3628DD),
//                             padding: const EdgeInsets.symmetric(vertical: 15.0),
//                             textStyle: const TextStyle(fontSize: 18),
//                           ),
//                           child: const Text(
//                             'Move up',
//                             style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 11, fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             // Additional activity boxes can be added here...
//           ],
//         ),
//       ),
//     );
//   }

//   // Function to build legend items
//   Widget _buildLegendItem(Color color, String label) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           width: 16,
//           height: 16,
//           color: color,
//         ),
//         const SizedBox(width: 4),
//         Text(label),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class YourActivityScreen extends StatefulWidget {
  const YourActivityScreen({super.key});

  @override
  State<YourActivityScreen> createState() => _YourActivityScreenState();
}

class _YourActivityScreenState extends State<YourActivityScreen> {
  // Initialize currentDate directly
  String currentDate = DateFormat('MMM dd').format(DateTime.now());
  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Image.asset(
                "images/ai.png",
              ),
            ),
            const SizedBox(width: 50),
            Image.asset(
              "images/your activity.png",
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Your activity',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Text(
              'Low',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFFF44336)),
            ),

            // Curved Line Chart
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 160,
                child: LineChart(
                  LineChartData(
                    titlesData: const FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true),
                      ),
                    ),
                    gridData: const FlGridData(show: true),
                    borderData: FlBorderData(
                      show: true,
                      border:
                          Border.all(color: const Color(0xff37434d), width: 1),
                    ),
                    minX: 0,
                    maxX: 6,
                    minY: 0,
                    maxY: 100,
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          const FlSpot(0, 20),
                          const FlSpot(1, 50),
                          const FlSpot(2, 10),
                          const FlSpot(3, 70),
                          const FlSpot(4, 80),
                          const FlSpot(5, 40),
                          const FlSpot(6, 100),
                        ],
                        isCurved: true,
                        color: Colors.red,
                        barWidth: 4,
                        isStrokeCapRound: true,
                        belowBarData: BarAreaData(show: false),
                        dotData: const FlDotData(show: true),
                      ),
                    ],
                    lineTouchData: LineTouchData(
                      touchTooltipData: LineTouchTooltipData(
                        getTooltipItems: (List<LineBarSpot> touchedSpots) {
                          return touchedSpots.map((spot) {
                            return LineTooltipItem(
                              'X: ${spot.x}\nY: ${spot.y}',
                              const TextStyle(color: Colors.white),
                            );
                          }).toList();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Legend at the bottom left
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Color(0xFF958CFA),
                      ),
                      child: Center(
                          child: Text(
                        currentDate,
                        style: const TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('6 New Contacts'),
                        Text('13 New Visitors'),
                        Text('13 New Likes'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Text(
              "Increase your activity instantly",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),

                        Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 120,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: const Color(0xFF3628DD), // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xFF958CFA),
                              child: Image.asset("images/video icon.png"),
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              // Use Expanded to make the text flexible
                              child: Text(
                                "Your free credits are just a quick video away!",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                                overflow:
                                    TextOverflow.ellipsis, // Handle overflow
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                          height: 10), // Add some space between text and button
                      SizedBox(
                        width: MediaQuery.of(context).size.width, // Make button take full width
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80.0),
                          child: ElevatedButton(
                            onPressed: () {
                              _showDialog('Free Credit',
                                  '10 free credits added successfully');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3628DD),
                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                            child: const Text(
                              'Get 10 free credits',
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

                        Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 120,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: const Color(0xFF3628DD), // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xFF958CFA),
                              child: Image.asset("images/activity image.png"),
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              // Use Expanded to make the text flexible
                              child: Text(
                                "Move to the top and get seen by more people!",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                                overflow:
                                    TextOverflow.ellipsis, // Handle overflow
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                          height: 10), // Add some space between text and button
                      SizedBox(
                        width: MediaQuery.of(context).size.width, // Make button take full width
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80.0),
                          child: ElevatedButton(
                            onPressed: () {
                              
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3628DD),
                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                            child: const Text(
                              'Move up',
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 120,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: const Color(0xFF3628DD), // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xFF958CFA),
                              child: Image.asset("images/activity image.png"),
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              // Use Expanded to make the text flexible
                              child: Text(
                                "Appear more when people are swiping!",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                                overflow:
                                    TextOverflow.ellipsis, // Handle overflow
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                          height: 10), // Add some space between text and button
                      SizedBox(
                        width: MediaQuery.of(context).size.width, // Make button take full width
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80.0),
                          child: ElevatedButton(
                            onPressed: () {
                              
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3628DD),
                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                            child: const Text(
                              'Add extra shows',
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 120,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: const Color(0xFF3628DD), // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xFF958CFA),
                              child: Image.asset("images/activity image.png"),
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              // Use Expanded to make the text flexible
                              child: Text(
                                "Tell everyone you’re online and ready to chat!",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                                overflow:
                                    TextOverflow.ellipsis, // Handle overflow
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                          height: 10), // Add some space between text and button
                      SizedBox(
                        width: MediaQuery.of(context).size.width, // Make button take full width
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80.0),
                          child: ElevatedButton(
                            onPressed: () {
                              
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3628DD),
                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                            child: const Text(
                              'Show i’m online',
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
