import 'package:flutter/foundation.dart';
import '../models/cruise_destination.dart';

/// ViewModel: UI-independent booking state and user-action logic.
class CruiseBookingViewModel extends ChangeNotifier {
  final CruiseDestination destination;

  CruiseBookingViewModel({this.destination = CruiseDestination.demo})
      : _stars = destination.initialStars;

  static const List<String> availablePackages = [
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  DateTime _visitDate = DateTime.now();
  String _selectedPackage = availablePackages.first;
  bool _isDarkMode = false;
  bool _isStarred = false;
  int _stars;

  DateTime get visitDate => _visitDate;
  String get selectedPackage => _selectedPackage;
  bool get isDarkMode => _isDarkMode;
  bool get isStarred => _isStarred;
  int get stars => _stars;

  void setVisitDate(DateTime date) {
    _visitDate = DateTime(date.year, date.month, date.day);
    notifyListeners();
  }

  void setPackage(String? package) {
    if (package == null || !availablePackages.contains(package)) return;
    _selectedPackage = package;
    notifyListeners();
  }

  void setDarkMode(bool enabled) {
    _isDarkMode = enabled;
    notifyListeners();
  }

  void toggleStar() {
    _isStarred = !_isStarred;
    _stars += _isStarred ? 1 : -1;
    notifyListeners();
  }
}
