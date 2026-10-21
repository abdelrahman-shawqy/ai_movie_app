import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/core/widgets/custom_text_field.dart';
import 'package:ai_movie_app/core/widgets/main_button.dart';
import 'package:ai_movie_app/core/widgets/password_text_field.dart';
import 'package:ai_movie_app/features/person/presentation/widgets/profile_avatar_widget.dart';
import 'package:ai_movie_app/features/person/presentation/widgets/screen_header.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController nameController ;
  late TextEditingController emailController ;
  late TextEditingController passwordController ;
  late TextEditingController phoneController ;
  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    const gap = SizedBox(height: 24);
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Expanded(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
            child: Form(
              key:formKey ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 52,),
                  ScreenHeader(title: 'Edit Profile',),
                  ProfileAvatarWidget(
                    name: "Tiffany",
                    email: 'Tiffanyjearsey@gmail.com',
                    image: AssetImage(AppImages.profilePic),
                  ),
                  SizedBox(height: 40,),
                  CustomTextField(labelText: 'Full Name',
                  controller: nameController,
                    validator:(text){
                      if(text==null||text.trim().isEmpty||text.length>11||text.length<=11){
                        return 'Please Enter Name ';
                      }
                    },

                  ),
                  gap,
                  CustomTextField(labelText: 'Email',
                    controller: emailController,
                    validator: (text) {
                      if(text==null||text.trim().isEmpty){
                        return 'Please Enter Email';
                      }
                      final bool emailValid = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                      ).hasMatch(text);
                      if(!emailValid){
                        return 'Please Enter Valid Email ';
                      }
                      return null ;
                    },

                  ),
                  gap,
                  PasswordTextField(labelText: 'Password',
                  passWordController: passwordController,
                    validator: (text) {
                      if(text==null||text.trim().isEmpty){
                        return ' Please Enter Password';
                      }
                      if(text.length<6){
                        return 'The Password Must Be Bigger Than 6 char';
                      }
                      return null;
                    },),
                  gap,
                  CustomTextField(labelText: 'Full Name',
                    controller: phoneController,
                    validator:(text){
                      if(text==null||text.trim().isEmpty||text.length>11||text.length<=11){
                        return 'Please Enter Phone Number ';
                      }
                    },

                  ),
                  SizedBox(height: 40,),
                  MainButton(label: 'Save Changes',onPressed: (){
                    Navigator.of(context).pop();
                  },),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
