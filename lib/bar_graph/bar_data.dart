import 'package:expense_tracker/bar_graph/indivisual_bar.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount,
  });

  List<IndivisualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndivisualBar(x: 0, y: sunAmount),
      IndivisualBar(x: 1, y: monAmount),
      IndivisualBar(x: 2, y: tueAmount),
      IndivisualBar(x: 3, y: wedAmount),
      IndivisualBar(x: 4, y: thurAmount),
      IndivisualBar(x: 5, y: friAmount),
      IndivisualBar(x: 6, y: satAmount),
    ];
  }
}
