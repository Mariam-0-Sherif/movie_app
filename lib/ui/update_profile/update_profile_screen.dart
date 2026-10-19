import 'package:flutter/material.dart';
import 'package:movie_app/ui/update_profile/widgets/avatar_picker_sheet.dart';
import 'package:movie_app/ui/widgets/custom_elevated_button.dart';
import 'package:movie_app/ui/widgets/custom_text_form_field.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/app_images.dart';
import 'package:movie_app/utils/app_styles.dart';
import 'package:movie_app/utils/size_utils.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  // Placeholder values until the logged in user's data is connected.
  final TextEditingController _nameController = TextEditingController(
    text: 'John Safwat',
  );
  final TextEditingController _phoneController = TextEditingController(
    text: '01200000000',
  );
  int _avatarIndex = 0;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickAvatar() async {
    final int? picked = await AvatarPickerSheet.show(
      context,
      selectedIndex: _avatarIndex,
    );
    if (picked == null || !mounted) return;
    setState(() => _avatarIndex = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.yellowColor),
        title: Text('Pick Avatar', style: AppStyles.regular16YellowRoboto),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeUtils.getWidth(context, 16),
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: SizeUtils.getHeight(context, 24)),
                      Center(child: _buildAvatar()),
                      SizedBox(height: SizeUtils.getHeight(context, 32)),
                      _buildField(
                        controller: _nameController,
                        icon: Icons.person,
                      ),
                      SizedBox(height: SizeUtils.getHeight(context, 16)),
                      _buildField(
                        controller: _phoneController,
                        icon: Icons.phone,
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: SizeUtils.getHeight(context, 24)),
                      Text(
                        'Reset Password',
                        style: AppStyles.regular16WhiteRoboto,
                      ),
                    ],
                  ),
                ),
              ),
              // The buttons do nothing yet, the logic comes with the auth cubit.
              _buildButton(
                title: 'Delete Account',
                color: AppColors.redColor,
                style: AppStyles.regular16WhiteRoboto,
              ),
              SizedBox(height: SizeUtils.getHeight(context, 16)),
              _buildButton(
                title: 'Update Data',
                color: AppColors.yellowColor,
                style: AppStyles.regular16DarkGrayRoboto,
              ),
              SizedBox(height: SizeUtils.getHeight(context, 16)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    final double size = SizeUtils.getWidth(context, 150);
    return GestureDetector(
      onTap: _pickAvatar,
      child: ClipOval(
        child: Image.asset(
          AppImages.avatarImagePaths[_avatarIndex],
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required IconData icon,
    TextInputType? keyboardType,
  }) {
    return CustomTextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: AppStyles.regular16WhiteRoboto,
      cursorColor: AppColors.yellowColor,
      borderSideColor: AppColors.transparentColor,
      fillColor: AppColors.darkGreyColor,
      filled: true,
      prefixIcon: Icon(icon, color: AppColors.whiteColor),
    );
  }

  Widget _buildButton({
    required String title,
    required Color color,
    required TextStyle style,
  }) {
    return SizedBox(
      width: double.infinity,
      child: CustomElevatedButton(
        onPressed: () {},
        backgroundColor: color,
        radius: 16,
        padding: EdgeInsets.symmetric(
          vertical: SizeUtils.getHeight(context, 14),
        ),
        child: Text(title, style: style),
      ),
    );
  }
}