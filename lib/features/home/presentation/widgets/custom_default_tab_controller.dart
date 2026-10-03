import 'package:ai_movie_app/core/theme/app_text_styles.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/features/home/presentation/controller/movie_list/movie_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDefaultTabController extends StatelessWidget {
   const CustomDefaultTabController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieListCubit,MovieListState>(
      builder: (context, state){
        switch(state){
          case MovieListLoading():
            return const CircularProgressIndicator();
          case MovieListSuccess():
            return DefaultTabController(
              length: state.movieList.length,
              animationDuration: Duration(milliseconds: 150),
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicatorColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: AppColors.PrimarySoft,
                  borderRadius: BorderRadius.circular(8),
                ),

                dividerColor: Colors.transparent,

                labelStyle: AppTextStyle.H6Medium500S12primaryBlueAccent,
                unselectedLabelStyle: AppTextStyle.H6Medium500S12,

                splashFactory: NoSplash.splashFactory,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                onTap: (index){
                  print('### $index');
                  print('###### ${state.movieList[index].id}');
                },
                tabs: state.movieList.map((e) => Container(
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Tab(child: Text(e.name)),
                ),).toList(),

              ),
            );
          case MovieListError():
            return Center(child: Text(state.errorMessage));
        }

    },);


  }
}
