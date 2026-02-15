import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ConditionAnalyticsCard extends StatelessWidget {
  const ConditionAnalyticsCard({super.key});

  @override
  Widget build(BuildContext context) {
    const double barHeight = 8.0;
    const double barWidth = 220.0; // adjust to fit your layout

    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1F2E), // dark card background
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'AI Condition Analytics',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
      
            // Centering
            _buildBarRow(
              label: 'Centering',
              percent: 0.95,
              barHeight: barHeight,
              barWidth: barWidth,
              progressColor: Colors.blueAccent,
            ),
            const SizedBox(height: 12),
      
            // Corners
            _buildBarRow(
              label: 'Corners',
              percent: 0.90,
              barHeight: barHeight,
              barWidth: barWidth,
              progressColor: Colors.blueAccent,
            ),
            const SizedBox(height: 12),
      
            // Edges
            _buildBarRow(
              label: 'Edges',
              percent: 0.88,
              barHeight: barHeight,
              barWidth: barWidth,
              progressColor: Colors.blueAccent,
            ),
            const SizedBox(height: 12),
      
            // Surface
            _buildBarRow(
              label: 'Surface',
              percent: 0.94,
              barHeight: barHeight,
              barWidth: barWidth,
              progressColor: Colors.blueAccent,
            ),
            const SizedBox(height: 24),
      
            // AI Confidence + Estimated Grade
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'AI Confidence',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '92%',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Estimated Grade',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        'PSA 9',
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
      
            const SizedBox(height: 28),
      
            // Detected Minor Issues
            const Text(
              'Detected Minor Issues:',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '• Minor edge wear on top right',
                  style: TextStyle(color: Colors.orangeAccent, fontSize: 14),
                ),
                SizedBox(height: 4),
                Text(
                  '• Slight surface scratch',
                  style: TextStyle(color: Colors.orangeAccent, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarRow({
    required String label,
    required double percent, // 0.0 to 1.0
    required double barHeight,
    required double barWidth,
    required Color progressColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(color: Colors.white70, fontSize: 15),
            ),
            Text(
              '${(percent * 100).toInt()}% 100%',
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
        const SizedBox(height: 6),
        LinearPercentIndicator(
          width: barWidth,
          lineHeight: barHeight,
          percent: percent,
          backgroundColor: Colors.grey.withOpacity(0.35),
          progressColor: progressColor,
          animation: true,
          animationDuration: 1400,
          curve: Curves.easeInOut,
          barRadius: const Radius.circular(999),
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}