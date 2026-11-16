import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

/// View: binds booking inputs to a ChangeNotifier ViewModel.
class BookingControlsWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const BookingControlsWidget({super.key, required this.viewModel});

  Future<void> _selectDate(BuildContext context) async {
    final today = DateTime.now();
    final firstDay = DateTime(today.year, today.month, today.day);
    final picked = await showDatePicker(
      context: context,
      initialDate: viewModel.visitDate.isBefore(firstDay)
          ? firstDay
          : viewModel.visitDate,
      firstDate: firstDay,
      lastDate: DateTime(today.year + 2, 12, 31),
      helpText: 'SELECT YOUR CRUISE DATE',
    );
    if (picked != null) viewModel.setVisitDate(picked);
  }

  @override
  Widget build(BuildContext context) {
    final dateText = MaterialLocalizations.of(context)
        .formatMediumDate(viewModel.visitDate);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Trip Preferences',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
            const Divider(height: 18),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.calendar_month),
              title: const Text('Visit Date'),
              subtitle: Text(dateText),
              trailing: const Icon(Icons.edit_calendar),
              onTap: () => _selectDate(context),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: viewModel.selectedPackage,
              isExpanded: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.directions_boat),
                labelText: 'Cruise Package',
              ),
              items: CruiseBookingViewModel.availablePackages
                  .map((package) => DropdownMenuItem<String>(
                        value: package,
                        child: Text(package, overflow: TextOverflow.ellipsis),
                      ))
                  .toList(),
              onChanged: viewModel.setPackage,
            ),
            const SizedBox(height: 8),
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              secondary: const Icon(Icons.dark_mode_outlined),
              title: const Text('Dark Mode'),
              subtitle: const Text('Switch between light and dark themes'),
              value: viewModel.isDarkMode,
              onChanged: viewModel.setDarkMode,
            ),
            const SizedBox(height: 4),
            Text('Selected package: ${viewModel.selectedPackage}',
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 4),
            Text('Demo only — no real cruise reservation is submitted.',
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
