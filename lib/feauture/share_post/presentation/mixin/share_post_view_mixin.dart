import 'package:flutter/material.dart';
import 'package:flutter_food_recipe_application/feauture/share_post/presentation/view/share_post_view.dart';

mixin SharePostViewMixin on State<SharePostView> {
  final PageController pageController = PageController();
  int currentPage = 0;
  final int totalPages = 3;
  late TextEditingController recipeNameController;
  late TextEditingController recipeDescriptionController;
  double _currentSliderValue = 30;

  @override
  void initState() {
    recipeNameController = TextEditingController();
    recipeDescriptionController = TextEditingController();
    super.initState();
  }
}
