import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class InterestsSection extends StatefulWidget {
  const InterestsSection({super.key});

  @override
  State<InterestsSection> createState() => _InterestsSectionState();
}

class _InterestsSectionState extends State<InterestsSection> {
  List<String> selectedInterests = ['Mindfulness', 'Motivation'];

  final List<String> allInterests = [
    'Mindfulness',
    'Stress Relief',
    'Nutrition',
    'Entrepreneurship',
    'Motivation',
    'Confidence',
  ];

  void toggleInterest(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else {
        selectedInterests.add(interest);
      }
    });
  }

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
          Text('My Interests', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: allInterests.map((interest) {
              final isSelected = selectedInterests.contains(interest);
              return GestureDetector(
                onTap: () => toggleInterest(interest),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.textGold
                        : AppColors.unSelectColor,
                    borderRadius: BorderRadius.circular(44),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.textGold
                          : AppColors.textWhite,
                      width: 0.3,
                    ),
                  ),
                  child: Text(
                    interest,
                    style: AppTextStyles.chipText.copyWith(
                      color: isSelected ? AppColors.selectedText : AppColors.textWhite,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 14),
          _buildButton('Save Changes'),
        ],
      ),
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