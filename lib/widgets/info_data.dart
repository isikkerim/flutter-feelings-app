import 'package:flutter/material.dart';

class DynamicContentPage extends StatelessWidget {
  final String appBarTitle;
  final String imageUrl;
  final String pageTitle;
  final String introductionText;
  final List<Section> sections;

  DynamicContentPage({
    required this.appBarTitle,
    required this.imageUrl,
    required this.pageTitle,
    required this.introductionText,
    required this.sections,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(appBarTitle),
                background: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Üst Yazı Widget'ı
                        Text(
                          pageTitle,
                          style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16),
                        Text(
                          introductionText,
                          style: theme.textTheme.bodyMedium,
                        ),
                        SizedBox(height: 16),
                        // Dinamik Bölümler
                        ...sections.map((section) => _buildSection(context, section)).toList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, Section section) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          section.title,
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        ...section.contents.map((content) {
          if (content is InteractiveExercise) {
            return _buildInteractiveExercise(context, content);
          } else if (content is SimpleTask) {
            return _buildSimpleTask(context, content);
          } else {
            return SizedBox.shrink();
          }
        }).toList(),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildInteractiveExercise(BuildContext context, InteractiveExercise exercise) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme.colorScheme.primary, width: 1.5),
      ),
      shadowColor: theme.shadowColor,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exercise.title,
              style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: theme.colorScheme.secondary),
            ),
            SizedBox(height: 8),
            Text(exercise.description, style: theme.textTheme.bodyMedium),
            SizedBox(height: 8),
            Text('Fayda: ${exercise.benefit}', style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  Widget _buildSimpleTask(BuildContext context, SimpleTask task) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme.colorScheme.secondary, width: 1.5),
      ),
      shadowColor: theme.shadowColor,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: theme.colorScheme.secondary),
            ),
            SizedBox(height: 8),
            Text(task.description, style: theme.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

class Section {
  final String title;
  final List<dynamic> contents;

  Section({required this.title, required this.contents});
}

class InteractiveExercise {
  final String title;
  final String description;
  final String benefit;

  InteractiveExercise({
    required this.title,
    required this.description,
    required this.benefit,
  });
}

class SimpleTask {
  final String title;
  final String description;

  SimpleTask({
    required this.title,
    required this.description,
  });
}
