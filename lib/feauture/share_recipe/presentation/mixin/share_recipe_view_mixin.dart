import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/share_recipe_export.dart';

mixin ShareRecipeViewMixin on State<ShareRecipeView> {
  // Page controller to manage page navigation
  late PageController pageController;

  // Current page index
  int _currentPage = 0;

  // Getter for current page index
  int get currentPage => _currentPage;

  // Total number of pages
  final int _totalPages = 4;

  // Getter for total pages
  int get totalPage => _totalPages;

  /// Handles the page change event by updating the current page index
  void onPageChanged(int index) {
    _currentPage = index;
    setState(() {});
  }

  /// Initializes the page controller
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  /// Disposes the page controller to free up resources
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  /// Resets the ShareRecipeViewModel state when navigating back
  void onPopInvoked() {
    context.read<ShareRecipeViewModel>().reset();
  }

  /// Navigates to the previous page in the page controller
  void previusPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }
}
