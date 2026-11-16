import 'package:flutter/material.dart';

/// View: image/banner only. The URL is provided by the Model.
class HeaderImageWidget extends StatelessWidget {
  final String imageUrl;
  final bool expand;

  const HeaderImageWidget({
    super.key,
    required this.imageUrl,
    this.expand = false,
  });

  @override
  Widget build(BuildContext context) {
    final image = ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: Colors.teal.shade700,
              child: const Center(
                child: Icon(Icons.sailing, size: 84, color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              color: Colors.black54,
              child: const Text(
                'RAJANG RIVER • SIBU',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
            ),
          ),
        ],
      ),
    );

    return expand ? SizedBox.expand(child: image) : SizedBox(height: 220, child: image);
  }
}
