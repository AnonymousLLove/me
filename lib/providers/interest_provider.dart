import 'package:flutter/material.dart';

class InterestsProvider extends ChangeNotifier {
  List<String> _interests = [
    'Travel',
    'Cooking',
    'Hiking',
    'Yoga',
    'Gaming',
    'Movies',
    'Photography',
    'Music',
    'Pets',
    'Painting',
    'Art',
    'Fitness',
    'Reading',
    'Dancing',
    'Sport',
    'Board games',
    'Technology',
    'Fashion',
    'Motorcycling'
  ];

  List<String> _selectedInterests = [];
  List<String> _filteredInterests = [];
  String _searchQuery = '';

  final Map<String, String> _interestIcons = {
    'Travel': 'assets/images/icons/interest/travel.png',
    'Cooking': 'assets/images/icons/interest/cooking.png',
    'Hiking': 'assets/images/icons/interest/hiking.png',
    'Yoga': 'assets/images/icons/interest/yoga.png',
    'Gaming': 'assets/images/icons/interest/gaming.png',
    'Movies': 'assets/images/icons/interest/movies.png',
    'Photography': 'assets/images/icons/interest/photography.png',
    'Music': 'assets/images/icons/interest/music.png',
    'Pets': 'assets/images/icons/interest/pets.png',
    'Painting': 'assets/images/icons/interest/painting.png',
    'Art': 'assets/images/icons/interest/art.png',
    'Fitness': 'assets/images/icons/interest/fitness.png',
    'Reading': 'assets/images/icons/interest/reading.png',
    'Dancing': 'assets/images/icons/interest/dancing.png',
    'Sport': 'assets/images/icons/interest/sports.png',
    'Board games': 'assets/images/icons/interest/board_games.png',
    'Technology': 'assets/images/icons/interest/technology.png',
    'Fashion': 'assets/images/icons/interest/fashion.png',
    'Motorcycling': 'assets/images/icons/interest/motorcycling.png',
  };

  List<String> get interests => _interests;
  List<String> get selectedInterests => _selectedInterests;
  List<String> get filteredInterests => _filteredInterests;
  String get searchQuery => _searchQuery;

  Map<String, String> get interestIcons => _interestIcons;

  InterestsProvider() {
    _filteredInterests = List.from(_interests);
  }

  void toggleInterest(String interest) {
    if (_selectedInterests.contains(interest)) {
      _selectedInterests.remove(interest);
    } else if (_selectedInterests.length < 6) {
      _selectedInterests.add(interest);
    }
    notifyListeners();
  }

  void onSearchQueryChanged(String query) {
    _searchQuery = query;
    _filteredInterests = _interests
        .where(
            (interest) => interest.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
