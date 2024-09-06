import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/share_recipe/presentation/view/share_recipe_view.dart';

mixin ShareRecipeViewMixin on State<ShareRecipeView> {
  late PageController pageController;

  int _currentPage = 0;
  int get currentPage => _currentPage;
  final int _totalPages = 4;
  int get totalPage => _totalPages;

  void onPageChanged(int index) {
    _currentPage = index;
    setState(() {});
  }

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void previusPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linearToEaseOut,
    );
  }
}
