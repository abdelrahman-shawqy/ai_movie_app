import 'package:ai_movie_app/features/home/presentation/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.green,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchTextField()
          ],
        ),
      ),
    );
  }
}
