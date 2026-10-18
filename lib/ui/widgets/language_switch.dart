import 'package:flutter/material.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/app_images.dart';
import 'package:movie_app/utils/size_utils.dart';

class LanguageSwitch extends StatefulWidget {
  const LanguageSwitch({super.key});

  @override
  State<LanguageSwitch> createState() => _LanguageSwitchState();
}

// dah el widget bta3t el switch ely fel Login wel Register
class _LanguageSwitchState extends State<LanguageSwitch> {
  String selectedLanguage = 'en';
  double w(double value) => SizeUtils.getWidth(context, value);

  Widget buildFlag(String image, String language) {
    bool isSelected = selectedLanguage == language;

    return GestureDetector(
      onTap: () {
        selectedLanguage = language;
        setState(() {});
      },
      child: Container(
        width: w(28),
        height: w(28),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: isSelected
              ? Border.all(color: AppColors.yellowColor, width: 2)
              : null,
        ),
        child: ClipOval(child: Image.asset(image, fit: BoxFit.cover)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w(91),
      height: w(38),
      padding: EdgeInsets.all(w(3)),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.yellowColor, width: 2),
        borderRadius: BorderRadius.circular(w(19)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildFlag(AppImages.usFlagImagePath, 'en'),
          buildFlag(AppImages.egFlagImagePath, 'ar'),
        ],
      ),
    );
  }
}
