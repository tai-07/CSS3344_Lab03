import 'package:flutter/material.dart';
import 'viewmodels/cruise_booking_viewmodel.dart';
import 'views/cruise_booking_screen.dart';

void main() => runApp(const RajangRiverApp());

/// App entry point: listens to ViewModel to switch app-wide ThemeMode.
class RajangRiverApp extends StatefulWidget {
  const RajangRiverApp({super.key});

  @override
  State<RajangRiverApp> createState() => _RajangRiverAppState();
}

class _RajangRiverAppState extends State<RajangRiverApp> {
  late final CruiseBookingViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = CruiseBookingViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _viewModel,
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rajang River Cruise',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.teal,
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.teal,
          brightness: Brightness.dark,
        ),
        themeMode: _viewModel.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: CruiseBookingScreen(viewModel: _viewModel),
      ),
    );
  }
}
