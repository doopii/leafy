import 'package:flutter/material.dart';
import '../constants/app_theme.dart';
import '../widgets/page_header.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageHeader(
              title: 'Education',
              subtitle: 'Learn about plants',
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Center(
                child: Icon(
                  Icons.school_outlined,
                  size: 100,
                  color: AppColors.iconColor.withOpacity(0.3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
