import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/booking_controls_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';

/// View: owns the responsive layout and delegates state to the ViewModel.
class CruiseBookingScreen extends StatefulWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({super.key, required this.viewModel});

  @override
  State<CruiseBookingScreen> createState() => _CruiseBookingScreenState();
}

class _CruiseBookingScreenState extends State<CruiseBookingScreen> {
  void _showDemoInfo(String title, String message) {
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> _shareDetails() async {
    final destination = widget.viewModel.destination;
    await Clipboard.setData(ClipboardData(
      text: '${destination.name}\n${destination.location}\n'
          'Package: ${widget.viewModel.selectedPackage}',
    ));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cruise details copied to clipboard.')),
    );
  }

  List<Widget> _details() {
    final vm = widget.viewModel;
    final destination = vm.destination;
    return [
      TitleSectionWidget(
        name: destination.name,
        location: destination.location,
        starCount: vm.stars,
        isStarred: vm.isStarred,
        onStarTap: vm.toggleStar,
      ),
      ActionBarWidget(
        onCall: () => _showDemoInfo(
          'CALL',
          'This is an academic demo. No cruise operator telephone number '
              'was provided in the lab brief.',
        ),
        onRoute: () => _showDemoInfo(
          'ROUTE',
          'Destination: Sibu Waterfront, Sarawak. A live map is not '
              'connected in this demo.',
        ),
        onShare: _shareDetails,
      ),
      const Divider(),
      DescriptionWidget(description: destination.description),
      BookingControlsWidget(viewModel: vm),
      const SizedBox(height: 20),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.viewModel,
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          title: const Text('Sibu River Cruise & Heritage'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: OrientationBuilder(
            builder: (context, orientation) {
              final imageUrl = widget.viewModel.destination.imageUrl;
              if (orientation == Orientation.landscape) {
                return Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: HeaderImageWidget(
                          imageUrl: imageUrl,
                          expand: true,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: ListView(
                        padding: const EdgeInsets.all(12),
                        children: _details(),
                      ),
                    ),
                  ],
                );
              }

              return ListView(
                padding: const EdgeInsets.all(12),
                children: [
                  HeaderImageWidget(imageUrl: imageUrl),
                  const SizedBox(height: 6),
                  ..._details(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
