import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class SecuritySection extends StatelessWidget {
  const SecuritySection({super.key});

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
          Text('Account Security', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 8),
          Text('Change Password', style: AppTextStyles.labelGold2),
          const SizedBox(height: 12),
          _buildPasswordField('Current Password'),
          const SizedBox(height: 5),
          _buildPasswordField('New Password'),
          const SizedBox(height: 5),
          _buildPasswordField('Confirm Password'),
          const SizedBox(height: 16),
          _buildButton('Updated Password'),
        ],
      ),
    );
  }

  Widget _buildPasswordField(String label) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 14, right: 26, bottom: 14, left: 16),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(19),
      ),
      child: Text(label, style: AppTextStyles.bodyText),
    );
  }

  Widget _buildButton(String text) {
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
        child: Text(text, style: AppTextStyles.buttonText),
      ),
    );
  }
}