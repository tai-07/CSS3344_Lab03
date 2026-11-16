import 'package:flutter/material.dart';

/// View: evenly spaced CALL, ROUTE and SHARE actions.
class ActionBarWidget extends StatelessWidget {
  final VoidCallback onCall;
  final VoidCallback onRoute;
  final VoidCallback onShare;

  const ActionBarWidget({
    super.key,
    required this.onCall,
    required this.onRoute,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ActionItem(icon: Icons.call, label: 'CALL', onTap: onCall),
          _ActionItem(icon: Icons.route, label: 'ROUTE', onTap: onRoute),
          _ActionItem(icon: Icons.share, label: 'SHARE', onTap: onShare),
        ],
      ),
    );
  }
}

class _ActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 4),
              Text(label, style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
        ),
      ),
    );
  }
}
