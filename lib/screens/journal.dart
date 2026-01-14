import 'package:flutter/material.dart';
import '../constants/app_theme.dart';
import '../widgets/calendar_view.dart';
import '../widgets/month_year_picker.dart';
import '../widgets/note_dialog.dart';
import '../widgets/page_header.dart';
import '../widgets/app_card.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();

  // Sample recorded dates - in real app, load from storage/database
  final Set<DateTime> _recordedDates = {
    DateTime.now().subtract(const Duration(days: 1)),
    DateTime.now().subtract(const Duration(days: 2)),
    DateTime.now().subtract(const Duration(days: 3)),
    DateTime.now().subtract(const Duration(days: 5)),
    DateTime.now().subtract(const Duration(days: 6)),
    DateTime.now().subtract(const Duration(days: 10)),
    DateTime.now().subtract(const Duration(days: 15)),
  };

  int get _currentStreak {
    int streak = 0;
    DateTime checkDate = DateTime.now();
    
    while (true) {
      final hasRecord = _recordedDates.any((d) =>
          d.year == checkDate.year &&
          d.month == checkDate.month &&
          d.day == checkDate.day);
      
      if (hasRecord) {
        streak++;
        checkDate = checkDate.subtract(const Duration(days: 1));
      } else if (streak == 0) {
        // Check yesterday if today not recorded yet
        checkDate = checkDate.subtract(const Duration(days: 1));
        final yesterdayHasRecord = _recordedDates.any((d) =>
            d.year == checkDate.year &&
            d.month == checkDate.month &&
            d.day == checkDate.day);
        if (yesterdayHasRecord) {
          streak++;
          checkDate = checkDate.subtract(const Duration(days: 1));
        } else {
          break;
        }
      } else {
        break;
      }
    }
    return streak;
  }

  int get _totalEntries => _recordedDates.length;

  void _showNoteDialog(DateTime date) {
    showDialog(
      context: context,
      builder: (context) => NoteDialog(date: date),
    );
  }

  void _changeMonth(int delta) {
    setState(() {
      _focusedDate = DateTime(_focusedDate.year, _focusedDate.month + delta, 1);
    });
  }

  void _showMonthYearPicker() {
    showDialog(
      context: context,
      builder: (context) => MonthYearPickerDialog(
        initialDate: _focusedDate,
        onDateSelected: (date) {
          setState(() {
            _focusedDate = date;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageHeader(
              title: 'Journal',
              subtitle: 'Your plant care trail',
            ),
            const SizedBox(height: 20),
            _buildMonthSelector(),
            const SizedBox(height: 16),
            CalendarView(
              selectedDate: _selectedDate,
              focusedDate: _focusedDate,
              recordedDates: _recordedDates,
              currentStreak: _currentStreak,
              totalNotes: _totalEntries,
              onDateSelected: (date) {
                setState(() {
                  _selectedDate = date;
                });
                _showNoteDialog(date);
              },
            ),
            const SizedBox(height: 20),
            _buildRecentNotesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentNotesSection() {
    // Sample notes data - in real app, load from storage
    final recentNotes = [
      _NoteItem(
        date: DateTime.now().subtract(const Duration(days: 1)),
        title: 'Watered tomatoes',
        preview: 'Added fertilizer to the soil...',
      ),
      _NoteItem(
        date: DateTime.now().subtract(const Duration(days: 2)),
        title: 'Pruned basil leaves',
        preview: 'Removed yellow leaves from...',
      ),
      _NoteItem(
        date: DateTime.now().subtract(const Duration(days: 3)),
        title: 'Repotted pepper plant',
        preview: 'Moved to larger pot with...',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Notes',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        ...recentNotes.map((note) => _buildNoteCard(note)),
      ],
    );
  }

  Widget _buildNoteCard(_NoteItem note) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: AppCard(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.accent.withOpacity(0.15),
                borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                border: Border.all(color: AppColors.border, width: 1),
              ),
              child: Center(
                child: Text(
                  '${note.date.day}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.accent,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    note.preview,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 20,
              color: AppColors.iconColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthSelector() {
    return GestureDetector(
      onTap: _showMonthYearPicker,
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! < 0) {
          _changeMonth(1);
        } else if (details.primaryVelocity! > 0) {
          _changeMonth(-1);
        }
      },
      child: AppCard(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chevron_left, color: AppColors.iconColor),
            const SizedBox(width: 16),
            Text(
              '${_getMonthName(_focusedDate.month)} ${_focusedDate.year}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(width: 16),
            Icon(Icons.chevron_right, color: AppColors.iconColor),
          ],
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }
}

/// Data class for note items
class _NoteItem {
  final DateTime date;
  final String title;
  final String preview;

  const _NoteItem({
    required this.date,
    required this.title,
    required this.preview,
  });
}
