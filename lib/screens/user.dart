import 'package:flutter/material.dart';
import '../constants/app_theme.dart';
import '../widgets/button.dart';
import '../widgets/page_header.dart';
import '../widgets/app_card.dart';
import '../widgets/info_card.dart';
import 'login.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageHeader(title: 'Profile'),
            const SizedBox(height: 30),
            _buildProfileCard(),
            const SizedBox(height: 24),
            const InfoCard(
              icon: Icons.local_florist_outlined,
              title: 'My Plants',
              value: '12',
            ),
            const SizedBox(height: 16),
            const InfoCard(
              icon: Icons.notifications_outlined,
              title: 'Active Alerts',
              value: '5',
            ),
            const SizedBox(height: 16),
            const InfoCard(
              icon: Icons.assignment_outlined,
              title: 'Detection History',
              value: '23',
            ),
            const Spacer(),
            AppButton(
              text: 'Log Out',
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return AppCard(
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.accent,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.border,
                width: AppSizes.borderWidth,
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.person,
                size: 50,
                color: AppColors.background,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'John Doe',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'john.doe@example.com',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
