import 'package:flutter/material.dart';
import '../constants/app_theme.dart';
import '../widgets/button.dart';
import '../widgets/page_header.dart';
import '../widgets/app_card.dart';
import 'detection_result.dart';

class DiseaseDetectionPage extends StatefulWidget {
  const DiseaseDetectionPage({super.key});

  @override
  State<DiseaseDetectionPage> createState() => _DiseaseDetectionPageState();
}

class _DiseaseDetectionPageState extends State<DiseaseDetectionPage> {
  void _handleCameraUpload() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DetectionResultPage(
          plantType: 'Tomato',
          diseaseName: 'Early Blight',
          confidence: 92,
          description: 'Causes brown spots on leaves and weakens plant growth.',
        ),
      ),
    );
  }

  void _handleGalleryUpload() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DetectionResultPage(
          plantType: 'Bell Pepper',
          diseaseName: 'Bacterial Spot',
          confidence: 87,
          description: 'Creates dark lesions on leaves and fruits, reducing yield.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageHeader(
              title: 'Detect Disease',
              subtitle: 'Identify plant issues',
            ),
            const SizedBox(height: 30),
            // Big image placeholder card
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceDark,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_outlined,
                            size: 80,
                            color: AppColors.iconColor.withOpacity(0.3),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Upload a leaf photo',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Good lighting, single leaf',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 140,
                                child: AppButton(
                                  text: 'CAMERA',
                                  onPressed: _handleCameraUpload,
                                ),
                              ),
                              const SizedBox(width: 16),
                              SizedBox(
                                width: 140,
                                child: AppButton(
                                  text: 'GALLERY',
                                  onPressed: _handleGalleryUpload,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Recent detections section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Recent detections',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildRecentDetectionCard('Tomato Blight'),
                      const SizedBox(height: 12),
                      _buildRecentDetectionCard('Leaf Spot'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentDetectionCard(String disease) {
    return AppCard(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.surfaceDark,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: AppColors.border,
                width: 1,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.eco,
                size: 30,
                color: AppColors.iconColor.withOpacity(0.4),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            disease,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
