import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class DataBackupSection extends StatelessWidget {
  const DataBackupSection({super.key});

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
          Text('Data & Backup', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildIconButton("assets/images/export.svg", 'Export'),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: _buildIconButton("assets/images/import.svg", 'Import'),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: _buildIconButton("assets/images/delete.svg", 'Delete'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(String icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon, height: 20,),
          const SizedBox(width: 8),
          Text(
            label,
            style: AppTextStyles.bodyTextWhite,
          ),
        ],
      ),
    );
  }
}