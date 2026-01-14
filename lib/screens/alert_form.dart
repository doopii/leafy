import 'package:flutter/material.dart';
import '../constants/app_theme.dart';
import '../widgets/button.dart';

class AlertFormPage extends StatefulWidget {
  const AlertFormPage({super.key});

  @override
  State<AlertFormPage> createState() => _AlertFormPageState();
}

class _AlertFormPageState extends State<AlertFormPage> {
  String _selectedPlant = 'Tomato';
  String _selectedAlertType = 'Watering';
  TimeOfDay _selectedTime = const TimeOfDay(hour: 8, minute: 0);
  String _selectedFrequency = 'Daily';
  bool _weatherBased = true;

  final List<String> _plants = ['Tomato', 'Basil', 'Rose', 'Orchid', 'Cactus'];
  final List<String> _alertTypes = ['Watering', 'Fertilizer', 'Leaf Check'];
  final List<String> _frequencies = ['Daily', 'Weekly'];

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: AppColors.background,
              hourMinuteTextColor: AppColors.textPrimary,
              dialHandColor: AppColors.accent,
              dialBackgroundColor: AppColors.background,
              dayPeriodTextColor: AppColors.textPrimary,
              dayPeriodColor: AppColors.accent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                side: const BorderSide(
                  color: AppColors.border,
                  width: AppSizes.borderWidth,
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _saveAlert() {
    // TODO: Save alert logic
    Navigator.pop(context);
  }

  Widget _buildAlertTypeButton({required String type, required IconData icon}) {
    final bool isSelected = _selectedAlertType == type;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAlertType = type;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.accent : AppColors.background,
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
          children: [
            Icon(
              icon,
              size: 32,
              color: isSelected ? AppColors.background : AppColors.iconColor,
            ),
            const SizedBox(height: 8),
            Text(
              type,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColors.background : AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

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
          'Create Alert',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Plant type selector
              const Text(
                'Plant Type',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedPlant,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.iconColor),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _selectedPlant = newValue;
                        });
                      }
                    },
                    items: _plants.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Alert type selector
              const Text(
                'Alert Type',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildAlertTypeButton(
                      type: 'Watering',
                      icon: Icons.water_drop,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildAlertTypeButton(
                      type: 'Fertilizer',
                      icon: Icons.eco,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildAlertTypeButton(
                      type: 'Leaf Check',
                      icon: Icons.visibility,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Preferred time picker
              const Text(
                'Preferred Time',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () => _selectTime(context),
                child: Container(
                  width: double.infinity,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedTime.format(context),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const Icon(Icons.access_time, color: AppColors.iconColor),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Frequency selector
              const Text(
                'Frequency',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedFrequency,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.iconColor),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _selectedFrequency = newValue;
                        });
                      }
                    },
                    items: _frequencies.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Weather-based toggle
              Container(
                width: double.infinity,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Weather-based',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _weatherBased = !_weatherBased;
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 32,
                        decoration: BoxDecoration(
                          color: _weatherBased ? AppColors.accent : AppColors.surfaceDark,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColors.border,
                            width: AppSizes.borderWidth,
                          ),
                        ),
                        child: AnimatedAlign(
                          duration: const Duration(milliseconds: 200),
                          alignment: _weatherBased ? Alignment.centerRight : Alignment.centerLeft,
                          child: Container(
                            width: 24,
                            height: 24,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.border,
                                width: AppSizes.borderWidth,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Save button
              AppButton(
                text: 'Save',
                onPressed: _saveAlert,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
