import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LinearRateBar extends StatelessWidget {
  const LinearRateBar({super.key, this.icon, required this.rate});
  final IconData? icon;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: LinearPercentIndicator(
        animationDuration: 2000,
        animation: true,
        leading: Icon(icon, size: 20),
        barRadius: Radius.circular(30),
        width: MediaQuery.of(context).size.width / 4,
        lineHeight: MediaQuery.of(context).size.height / 100,
        percent: rate,
        backgroundColor: Colors.grey.shade400,
        progressColor: Colors.amber,
      ),
    );
  }
}
