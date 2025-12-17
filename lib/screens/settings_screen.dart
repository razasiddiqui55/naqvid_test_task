import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../widgets/profile_section.dart';
import '../widgets/interests_section.dart';
import '../widgets/security_section.dart';
import '../widgets/data_backup_section.dart';
import '../widgets/preferences_section.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 35),
                const ProfileSection(),
                const SizedBox(height: 14),
                const InterestsSection(),
                const SizedBox(height: 14),
                const SecuritySection(),
                const SizedBox(height: 14),
                const DataBackupSection(),
                const SizedBox(height: 14),
                const PreferencesSection(),
                const SizedBox(height: 24),
                _buildChallengeButton(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
             SvgPicture.asset(
              "assets/images/backArrow.svg",
            ),
            const SizedBox(width: 15),
            Text('Settings', style: AppTextStyles.header),
          ],
        ),
        Text('Save', style: AppTextStyles.saveButton),
      ],
    );
  }

  Widget _buildChallengeButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.textGold,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.86),
          ),
          elevation: 0,
        ),
        child: Text('Challenge a Friend', style: AppTextStyles.buttonText),
      ),
    );
  }
}