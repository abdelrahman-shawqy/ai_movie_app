import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/routing/route.dart';
import 'package:ai_movie_app/features/person/presentation/widgets/logout_button.dart';
import 'package:ai_movie_app/features/person/presentation/widgets/logout_confirmation_dialog.dart';
import 'package:ai_movie_app/features/person/presentation/widgets/profile_colors.dart';
import 'package:ai_movie_app/features/person/presentation/widgets/profile_header_card.dart';
import 'package:ai_movie_app/features/person/presentation/widgets/settings_section.dart';
import 'package:ai_movie_app/features/person/presentation/widgets/settings_tile.dart';
import 'package:flutter/material.dart';



class PersonTab extends StatelessWidget {
  const PersonTab({
    super.key,
    this.name = 'Tiffany',
    this.email = 'Tiffanyjearsey@gmail.com',
    this.onEditProfile,
    this.onPremiumTap,
    this.onMember,
    this.onChangePassword,
    this.onNotification,
    this.onLanguage,
    this.onCountry,
    this.onClearCache,
    this.onLegal,
    this.onHelp,
    this.onAbout,
    this.onLogout,
  });

  final String name;
  final String email;

  final VoidCallback? onEditProfile;
  final VoidCallback? onPremiumTap;
  final VoidCallback? onMember;
  final VoidCallback? onChangePassword;
  final VoidCallback? onNotification;
  final VoidCallback? onLanguage;
  final VoidCallback? onCountry;
  final VoidCallback? onClearCache;
  final VoidCallback? onLegal;
  final VoidCallback? onHelp;
  final VoidCallback? onAbout;
  final VoidCallback? onLogout;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final horizontalPadding = (width * 0.064).clamp(16.0, 32.0);
    const gap = SizedBox(height: 20);
    return Scaffold(
      backgroundColor: ProfileColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Profile',
                style: TextStyle(
                  color: ProfileColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  horizontalPadding,
                  8,
                  horizontalPadding,
                  24,
                ),
                child: Column(
                  children: [
                    ProfileHeaderCard(
                      name: name,
                      email: email,
                      avatar: AppImages.profilePic,
                    ),
                    gap,
                    Image.asset('assets/images/premium_banner.png',width: double.infinity,fit: BoxFit.fill,),
                    gap,
                    SettingsSection(
                      title: 'Account',
                      children: [
                        SettingsTile(
                          icon: Icons.person_rounded,
                          iconColor: ProfileColors.accent,
                          title: 'Member',
                          onTap: onMember,
                        ),
                        SettingsTile(
                          icon: Icons.lock_rounded,
                          title: 'Change Password',
                          onTap: onChangePassword,
                        ),
                      ],
                    ),
                    gap,
                    SettingsSection(
                      title: 'General',
                      children: [
                        SettingsTile(
                          icon: Icons.notifications_rounded,
                          title: 'Notification',
                          onTap: (){
                            Navigator.pushNamed(context, Routes.notificationScreen);
                          },
                        ),
                        SettingsTile(
                          icon: Icons.language_rounded,
                          title: 'Language',
                          onTap: (){
                            Navigator.pushNamed(context, Routes.languageScreen);
                          },
                        ),
                        SettingsTile(
                          icon: Icons.flag_rounded,
                          title: 'Country',
                          onTap: onCountry,
                        ),
                        SettingsTile(
                          icon: Icons.delete_rounded,
                          title: 'Clear Cache',
                          onTap: onClearCache,
                        ),
                      ],
                    ),
                    gap,
                    SettingsSection(
                      title: 'More',
                      children: [
                        SettingsTile(
                          icon: Icons.shield_rounded,
                          title: 'Legal and Policies',
                          onTap: (){
                            Navigator.pushNamed(context, Routes.privacyPolicyScreen);
                          },
                        ),
                        SettingsTile(
                          icon: Icons.help_rounded,
                          title: 'Help & Feedback',
                          onTap: onHelp,
                        ),
                        SettingsTile(
                          icon: Icons.info_rounded,
                          title: 'About Us',
                          onTap: onAbout,
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    LogoutButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
