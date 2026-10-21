import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:ai_movie_app/features/person/presentation/widgets/screen_header.dart';
import 'package:flutter/material.dart';

import '../widgets/language_section.dart';
import '../widgets/language_tile.dart';

/// UI-only language picker. Does not change the app's actual locale.
class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key, });


  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selected = 'English (UK)';

  final List<String> _suggested = [
    'English (UK)',
    'English',
    'Bahasa Indonesia',
  ];

  final List<String> _others = [
    'Chineses',
    'Croatian',
    'Czech',
    'Danish',
    'Filipino',
    'Finnish',
  ];

  void _select(String language) {
    setState(() {
      _selected = language;
      // Move from "Other" to "Suggested"; never create duplicates.
      _others.remove(language);
      if (!_suggested.contains(language)) {
        _suggested.add(language);
      }
    });
  }

  List<Widget> _buildTiles(List<String> languages) {
    return [
      for (var i = 0; i < languages.length; i++)
        LanguageTile(
          language: languages[i],
          isSelected: languages[i] == _selected,
          onTap: _select,
          showDivider: i != languages.length - 1,
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 12),
              ScreenHeader(title: 'Language',),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    children: [
                      LanguageSection(
                        title: 'Suggested Languages',
                        children: _buildTiles(_suggested),
                      ),
                      if (_others.isNotEmpty) ...[
                        const SizedBox(height: 20),
                        LanguageSection(
                          title: 'Other Languages',
                          children: _buildTiles(_others),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
