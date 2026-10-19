
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShareWidget extends StatelessWidget {
   ShareWidget({
    super.key,
    required this.onClose,
    required this.onFacebookTap,
    required this.onInstagramTap,
    required this.onMessengerTap,
    required this.onSendTap,

  });
  final VoidCallback onClose;
  final VoidCallback onFacebookTap;
  final VoidCallback onInstagramTap;
  final VoidCallback onMessengerTap;
  final VoidCallback onSendTap;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 234,
      decoration: BoxDecoration(
        color: AppColors.PrimarySoft,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          // Close button
          Align(
            alignment: AlignmentGeometry.topRight,
            child: GestureDetector(
              onTap: onClose,
              child: Container(
                width: 42,
                height: 42,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Image.asset('assets/images/Close.png', fit: BoxFit.fill),
              ),
            ),
          ),
          Container(
            //color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 55),
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentGeometry.topCenter,
                    child: Text(
                      'Share to',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    width:266 ,
                    color: AppColors.mainColor.withOpacity(0.55),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _ShareItem(
                        imagePath: 'assets/images/facebook_iconn.png',
                        onTap: onFacebookTap,
                      ),
                      _ShareItem(
                        imagePath: 'assets/images/instgram_icon.png',

                        onTap: onInstagramTap,
                      ),
                      _ShareItem(
                        imagePath: 'assets/images/massenger_icon.png',

                        onTap: onMessengerTap,
                      ),
                      _ShareItem(
                        imagePath: 'assets/images/share_icon.png',
                        onTap: onSendTap,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A single circular share button (49x49).
class _ShareItem extends StatelessWidget {
  const _ShareItem({
    required this.imagePath,
    required this.onTap,
  });

  final String imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        onTap.call();
        print('helloooooooo');
        }
      ,
      child: Container(
        width: 49,
        height: 49,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

