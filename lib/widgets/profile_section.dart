import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

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
          Text('Profile Information', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 16),
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 77,
                    height: 77,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.borderLight,
                        width: 0.8,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/user.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 5,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.textGold,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/images/edit.svg",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Username', style: AppTextStyles.labelGold),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 26,
                        right: 75,
                        top: 12,
                        bottom: 12
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.inputBackground,
                        borderRadius: BorderRadius.circular(54),
                      ),
                      child: Center(
                        child: Text(
                          'livyshelma123',
                          style: AppTextStyles.bodyTextWhite,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text('Bio', style: AppTextStyles.labelGold2),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 8, right: 26, bottom: 103, left: 14),
            decoration: BoxDecoration(
              color: AppColors.inputBackground,
              borderRadius: BorderRadius.circular(19),
            ),
            child: Text(
              'Wellness through balance',
              style: AppTextStyles.bodyText.copyWith(
                color: AppColors.textWhite2,
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildButton('Save Changes'),
        ],
      ),
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
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
    );
  }
}
