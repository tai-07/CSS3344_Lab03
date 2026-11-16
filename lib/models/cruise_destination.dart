/// Model: immutable data representing a river cruise destination.
class CruiseDestination {
  final String name;
  final String location;
  final String description;
  final String imageUrl;
  final int initialStars;

  const CruiseDestination({
    required this.name,
    required this.location,
    required this.description,
    required this.imageUrl,
    required this.initialStars,
  });

  static const demo = CruiseDestination(
    name: 'Rajang River Explorer Cruise',
    location: 'Sibu Waterfront, Sarawak',
    description:
        'Discover Sibu\'s riverside scenery and cultural heritage along the '
        'Rajang River. Choose a preferred cruise package and visit date while '
        'exploring this interactive booking screen. This is a student demo; '
        'no real reservations are submitted.',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/6/60/'
        'Sibu_Rajang_river_view_from_Tua_Pek_Kong_temple.jpg',
    initialStars: 43,
  );
}
