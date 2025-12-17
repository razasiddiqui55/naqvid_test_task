import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class ChallengeFriendScreen extends StatefulWidget {
  const ChallengeFriendScreen({super.key});

  @override
  State<ChallengeFriendScreen> createState() => _ChallengeFriendScreenState();
}

class _ChallengeFriendScreenState extends State<ChallengeFriendScreen> {
  String? selectedMood;
  final TextEditingController _noteController = TextEditingController();

  final Map<String, String> moods = {
    'Angry': 'assets/images/angry.svg',
    'Sad': 'assets/images/sad.svg',
    'Anxious': 'assets/images/anx.svg',
    'Neutral': 'assets/images/neutral.svg',
    'Good': 'assets/images/happy.svg',
    'Alright': 'assets/images/alright.svg',
  };

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMoodSection(),
                const SizedBox(height: 34),
                _buildChallengeSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMoodSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How are you feeling today?',
            style: AppTextStyles.sectionTitle,
          ),
          const SizedBox(height: 12),
          _buildMoodGrid(),
          const SizedBox(height: 5),
          _buildNoteSection(),
          const SizedBox(height: 8),
          _buildMoodButtons(),
        ],
      ),
    );
  }

  Widget _buildMoodGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
        childAspectRatio: 1.4,
      ),
      itemCount: moods.length,
      itemBuilder: (context, index) {
        final entry = moods.entries.elementAt(index);
        final isSelected = selectedMood == entry.key;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedMood = entry.key;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.textGold
                  : AppColors.inputBackground,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? AppColors.textGold
                    : Colors.transparent,
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  entry.value,
                ),
                const SizedBox(height: 8),
                Text(
                  entry.key,
                  style: AppTextStyles.chipText.copyWith(
                    color: isSelected ? AppColors.selectedText : AppColors.textWhite,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNoteSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.inputBackground,
            borderRadius: BorderRadius.circular(6),
          ),
          child: TextField(
            controller: _noteController,
            style: AppTextStyles.bodyText,
            maxLines: 3,
            readOnly: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Add a quick note...',
              hintStyle: TextStyle(
                color: AppColors.textWhite70,
                fontSize: 14,
              ),
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMoodButtons() {
    return Row(
      children: [
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.transparent),
            backgroundColor: AppColors.unSelectColor,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Clear',
            style: AppTextStyles.buttonText.copyWith(
              color: AppColors.textWhite,
            ),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.textGold,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.86),
            ),
            elevation: 0,
          ),
          child: Text(
            'Save Mood',
            style: AppTextStyles.buttonText,
          ),
        ),
      ],
    );
  }

  Widget _buildChallengeSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send a Challenge Invitation',
            style: AppTextStyles.sectionTitle,
          ),
          const SizedBox(height: 16),
          Text(
            'Friend Username or Email',
            style: AppTextStyles.labelGold2,
          ),
          const SizedBox(height: 8),
          _buildInputField('@username or email'),
          const SizedBox(height: 16),
          Text(
            'Select Challenge',
            style: AppTextStyles.labelGold2,
          ),
          const SizedBox(height: 8),
          _buildDropdownField('Choose a Challenge'),
          const SizedBox(height: 16),
          Text(
            'Message',
            style: AppTextStyles.labelGold2,
          ),
          const SizedBox(height: 8),
          _buildMessageField(),
          const SizedBox(height: 16),
          _buildSendButton(),
        ],
      ),
    );
  }

  Widget _buildInputField(String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(41),
      ),
      child: TextField(
        style: AppTextStyles.bodyText,
        readOnly: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: AppTextStyles.bodyText.copyWith(
            color: AppColors.textWhite,
          ),
          isDense: true,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }

  Widget _buildDropdownField(String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(41),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hint,
            style: AppTextStyles.bodyText.copyWith(
              color: AppColors.textWhite,
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.textWhite70,
            size: 24,
          ),
        ],
      ),
    );
  }

  Widget _buildMessageField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
        style: AppTextStyles.bodyText,
        maxLines: 3,
        readOnly: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Write a message...',
          hintStyle: AppTextStyles.bodyText.copyWith(
            color: AppColors.textWhite,
          ),
          isDense: true,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }

  Widget _buildSendButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.textGold,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.86),
          ),
          elevation: 0,
        ),
        child: Text(
          'Send Invitation',
          style: AppTextStyles.buttonText,
        ),
      ),
    );
  }
}