import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/features/person/presentation/widgets/logout_confirmation_dialog.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: OutlinedButton(
        onPressed: (){
          showDialog(context: context, builder: (context){
            return LogoutConfirmationDialog();
          });
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryBlueAccent,
          side: const BorderSide(color: AppColors.primaryBlueAccent, width: 1.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        child: Text('Log Out',style:AppTextStyle.h4Semibold600S16,),
      ),
    );
  }
}
