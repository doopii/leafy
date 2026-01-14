import 'package:flutter/material.dart';
import '../constants/app_theme.dart';
import 'alert_form.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.iconColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Alerts',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AlertFormPage()),
          );
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(AppSizes.borderRadius),
            border: Border.all(
              color: AppColors.border,
              width: AppSizes.borderWidth,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF323232),
                offset: Offset(4, 4),
                blurRadius: 0,
                spreadRadius: 0,
              ),
            ],
          ),
          child: const Icon(
            Icons.add,
            color: AppColors.background,
            size: 32,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            // Example alert cards
            _buildAlertCard(
              plantType: 'Tomato',
              alertType: 'Watering',
              time: '08:00',
              frequency: 'Daily',
              weatherBased: true,
            ),
            const SizedBox(height: 16),
            _buildAlertCard(
              plantType: 'Basil',
              alertType: 'Fertilizer',
              time: '09:30',
              frequency: 'Weekly',
              weatherBased: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertCard({
    required String plantType,
    required String alertType,
    required String time,
    required String frequency,
    required bool weatherBased,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        border: Border.all(
          color: AppColors.border,
          width: AppSizes.borderWidth,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF323232),
            offset: Offset(4, 4),
            blurRadius: 0,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                plantType,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                  border: Border.all(
                    color: AppColors.border,
                    width: AppSizes.borderWidth,
                  ),
                ),
                child: Text(
                  alertType,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.background,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.access_time, size: 16, color: AppColors.textSecondary),
              const SizedBox(width: 6),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.repeat, size: 16, color: AppColors.textSecondary),
              const SizedBox(width: 6),
              Text(
                frequency,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
              if (weatherBased) ...[
                const SizedBox(width: 16),
                const Icon(Icons.cloud, size: 16, color: AppColors.accent),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
