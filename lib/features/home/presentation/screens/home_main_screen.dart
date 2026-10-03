import 'package:ai_movie_app/core/constants/app_images.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/features/download/presentation/screens/download_tab.dart';
import 'package:ai_movie_app/features/home/presentation/screens/home_tab.dart';
import 'package:ai_movie_app/features/home/presentation/widgets/selected_icon.dart';
import 'package:ai_movie_app/features/person/presentation/screens/person_tab.dart';
import 'package:ai_movie_app/features/search/presentation/screens/search_tab.dart';
import 'package:flutter/material.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  final List<Widget> destinations = [
    NavigationDestination(
      icon: Image.asset(AppImages.homeIcon),
      label: 'Home',
      selectedIcon: SelectedIcon(label: 'Home',imageIcon:AppImages.homeIcon,),
    ),
    NavigationDestination(
      icon: Image.asset(AppImages.searchIcon),
      label: 'Search',
      selectedIcon: SelectedIcon(label: 'Search',imageIcon:AppImages.searchIcon ,),

    ),
    NavigationDestination(
      icon: Image.asset(AppImages.downloadIcon),
      label: 'Download',
      selectedIcon: SelectedIcon(label: 'Download',imageIcon:AppImages.downloadIcon,),

    ),
    NavigationDestination(
      icon: Image.asset(AppImages.personIcon),
      label: 'Person',
      selectedIcon: SelectedIcon(label: 'Person',imageIcon:AppImages.personIcon,),

    ),
  ];
  final List <Widget> Tabs = [ HomeTab(),SearchTab(),DownloadTab(),PersonTab()] ;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: IndexedStack(
        children:Tabs ,
      index:selectedIndex ,
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.symmetric(horizontal:screenWidth *0.025),
        child: NavigationBar(
          destinations: destinations,
          backgroundColor: AppColors.mainColor,
          indicatorColor: AppColors.mainColor,
          selectedIndex: selectedIndex,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          animationDuration: Duration(milliseconds: 150),
          onDestinationSelected: (index) {
            setState(() {selectedIndex = index;});
          },

        ),
      ),
    );
  }

  sizedBoxFun({double? screenHeight, double? screenWidth}) {
    return SizedBox(height: screenHeight, width: screenWidth);
  }
}
