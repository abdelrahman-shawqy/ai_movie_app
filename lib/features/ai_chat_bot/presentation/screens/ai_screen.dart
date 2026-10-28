import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/features/ai_chat_bot/presentation/widgets/custom_text_field.dart';
import 'package:ai_movie_app/features/person/presentation/widgets/screen_header.dart';
import 'package:flutter/material.dart';

class AiScreen extends StatefulWidget {
  const AiScreen({super.key});

  @override
  State<AiScreen> createState() => _AiScreenState();
}
class _AiScreenState extends State<AiScreen> {
  late TextEditingController controller ;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                SizedBox(height: 24,),
                ScreenHeader(title: 'Chat Bot',),
                Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: CustomTextFieldChat(controller: controller,send: (){},),
            ),
                    ],
                  ),
          )),
    );
  }
}
