CSS3344 MOBILE APPLICATION DEVELOPMENT - LAB 03
=================================================
Student: SIM FOOK TAI
Student ID: BCS24020046
Title: UI Composition, Responsive Layouts, and MVVM Project Architecture

This package contains the lib/ source tree required by the lecturer's Figure 4.
The user should create a real Flutter application with Flutter SDK locally;
this ZIP is NOT a complete Flutter project until those generated platform files
(android/, ios/, etc.) exist.

SETUP ON WINDOWS (PowerShell or Android Studio Terminal)
--------------------------------------------------------
1. Open a terminal under C:\Users\User\Desktop\MAD
2. Run: flutter create rajang_river_cruise
3. Extract this ZIP into the new folder:
      C:\Users\User\Desktop\MAD\rajang_river_cruise
   Choose Replace/Overwrite for lib\main.dart.
4. Run:
      cd C:\Users\User\Desktop\MAD\rajang_river_cruise
      flutter pub get
      flutter run -d emulator-5554
5. Rotate the Android emulator to test the landscape layout.
6. Run `flutter analyze` to check issues. Flutter SDK is not installed in
   the environment where this source package was authored, so it has NOT
   been compiled or tested on an Android emulator here.

NO ADDITIONAL DART PACKAGES REQUIRED
------------------------------------
The ChangeNotifier pattern uses Flutter SDK only. An Image.network header
shows the Rajang River photo, and a local fallback icon appears if internet
connectivity fails. For offline-only operation download a permitted image and
replace Image.network(...) with Image.asset(...), registering it in pubspec.yaml.

IMPORTANT: ORIGINAL LAB 02 IS NOT MODIFIED
------------------------------------------
Use a NEW folder and a NEW public GitHub repo (e.g. CSS3344_Lab03).
Do not push Lab 03 over your completed Lab 02 repository.

MVVM ROLE OF EACH FILE
----------------------
lib/models/cruise_destination.dart: pure destination data
lib/viewmodels/cruise_booking_viewmodel.dart: date, package, theme, stars state
lib/views/cruise_booking_screen.dart: responsive screen composition
lib/views/widgets/*: independent visual UI sections
lib/main.dart: app initialization and app-wide dark/light theme

TO DEMONSTRATE THE SIX REQUIRED SCREENSHOTS
-------------------------------------------
1. Screenshot the lib/ folder hierarchy in the Android Studio Project pane.
2. Portrait complete screen, Light Theme.
3. Rotate emulator and capture the Landscape side-by-side split view.
4. Tap Visit Date and capture the open showDatePicker dialog.
5. Record star count before clicking and after clicking (initially 43 -> 44).
6. Toggle Dark Mode switch ON and capture dark mode.

REPORT
------
Submit a PDF containing student name and ID, public GitHub repository URL,
all six required screenshots, and a short reflection describing your actual
challenges and solutions. The lecturer does not require false claims about
live boat schedules, phone numbers, or confirmed reservations.

IMAGE SOURCE / LICENSE
----------------------
The image URL in lib/models/cruise_destination.dart refers to:
'Sibu Rajang river view from Tua Pek Kong temple.jpg' by Cerevisae,
licensed CC BY-SA 4.0 on Wikimedia Commons.
https://commons.wikimedia.org/wiki/File:Sibu_Rajang_river_view_from_Tua_Pek_Kong_temple.jpg
Use attribution if you redistribute the app/screenshots.

NOTE ABOUT BUTTONS
------------------
CALL and ROUTE are honest demo-only dialogs (no phone/operator/map was specified
by the PDF). SHARE copies a summary to the clipboard; no native share sheet.
The coursework explicitly requires the buttons, but does not specify that
external phone/maps/sharing plugins must be integrated.
