import 'package:flutter/material.dart';
import '../constants/app_theme.dart';
import '../widgets/button.dart';

class MonthYearPickerDialog extends StatefulWidget {
  final DateTime initialDate;
  final Function(DateTime) onDateSelected;

  const MonthYearPickerDialog({
    super.key,
    required this.initialDate,
    required this.onDateSelected,
  });

  @override
  State<MonthYearPickerDialog> createState() => _MonthYearPickerDialogState();
}

class _MonthYearPickerDialogState extends State<MonthYearPickerDialog> {
  late int _selectedYear;
  late int _selectedMonth;

  @override
  void initState() {
    super.initState();
    _selectedYear = widget.initialDate.year;
    _selectedMonth = widget.initialDate.month;
  }

  @override
  Widget build(BuildContext context) {
    final years = List.generate(100, (index) => DateTime.now().year - 50 + index);
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: const BoxConstraints(maxHeight: 500),
        padding: const EdgeInsets.all(24),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Select Month & Year',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                // Month selector
                Expanded(
                  child: Container(
                    height: 300,
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
                    child: ListView.builder(
                      itemCount: months.length,
                      itemBuilder: (context, index) {
                        final isSelected = _selectedMonth == index + 1;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedMonth = index + 1;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            color: isSelected ? AppColors.accent : Colors.transparent,
                            child: Text(
                              months[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: isSelected ? Colors.white : AppColors.textPrimary,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Year selector
                Expanded(
                  child: Container(
                    height: 300,
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
                    child: ListView.builder(
                      controller: ScrollController(
                        initialScrollOffset: (years.indexOf(_selectedYear) * 44.0),
                      ),
                      itemCount: years.length,
                      itemBuilder: (context, index) {
                        final isSelected = _selectedYear == years[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedYear = years[index];
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            color: isSelected ? AppColors.accent : Colors.transparent,
                            child: Text(
                              '${years[index]}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: isSelected ? Colors.white : AppColors.textPrimary,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: AppSizes.buttonHeight,
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
                      child: const Center(
                        child: Text(
                          'CANCEL',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AppButton(
                    text: 'SELECT',
                    onPressed: () {
                      widget.onDateSelected(DateTime(_selectedYear, _selectedMonth, 1));
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
