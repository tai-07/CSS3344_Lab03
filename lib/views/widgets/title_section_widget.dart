import 'package:flutter/material.dart';

/// View: destination title, location, and interactive star counter.
class TitleSectionWidget extends StatelessWidget {
  final String name;
  final String location;
  final int starCount;
  final bool isStarred;
  final VoidCallback onStarTap;

  const TitleSectionWidget({
    super.key,
    required this.name,
    required this.location,
    required this.starCount,
    required this.isStarred,
    required this.onStarTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 5),
                Text(location, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Tooltip(
            message: 'Tap to ${isStarred ? 'remove' : 'add'} your star',
            child: OutlinedButton.icon(
              onPressed: onStarTap,
              icon: Icon(
                isStarred ? Icons.star : Icons.star_border,
                color: Colors.amber.shade700,
              ),
              label: Text('$starCount'),
            ),
          ),
        ],
      ),
    );
  }
}
