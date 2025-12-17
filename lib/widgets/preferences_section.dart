import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class PreferencesSection extends StatefulWidget {
  const PreferencesSection({super.key});

  @override
  State<PreferencesSection> createState() => _PreferencesSectionState();
}

class _PreferencesSectionState extends State<PreferencesSection> {
  bool notificationsEnabled = true;
  String selectedLanguage = 'English';
  String selectedTheme = 'Dark';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Preferences', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 12),
          _buildNotificationToggle(),
          const SizedBox(height: 12),
          Text('Language:', style: AppTextStyles.labelGold),
          const SizedBox(height: 6),
          _buildDropdownItem('English:'),
          const SizedBox(height: 6),
          Text('Theme', style: AppTextStyles.labelGold),
          const SizedBox(height: 6),
          _buildDropdownItem('Dark'),
        ],
      ),
    );
  }

  Widget _buildNotificationToggle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Notifications', style: AppTextStyles.labelGold),
        GestureDetector(
          onTap: () {
            setState(() {
              notificationsEnabled = !notificationsEnabled;
            });
          },
          child: Container(
            width: 24,
            height: 22,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.textGold,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              notificationsEnabled ? Icons.check_rounded : null,
              size: 18,
              color: AppColors.textGold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownItem(String label) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 8, right: 20, bottom: 8, left: 16),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(19),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyles.bodyTextWhite),
          const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.textWhite70,
            size: 30,
          ),
        ],
      ),
    );
  }
}