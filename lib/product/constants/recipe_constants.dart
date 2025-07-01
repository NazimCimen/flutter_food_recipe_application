import 'package:flutter/material.dart';

class RecipeConstants {
  RecipeConstants._();
  static const List<DropdownMenuEntry<String>> cookingTypeDropList = [
    DropdownMenuEntry(value: 'Fırın', label: 'Fırın'),
    DropdownMenuEntry(value: 'Izgara', label: 'Izgara'),
    DropdownMenuEntry(value: 'Kızartma', label: 'Kızartma'),
    DropdownMenuEntry(value: 'Tava', label: 'Tava'),
    DropdownMenuEntry(value: 'Tencere', label: 'Tencere'),
    DropdownMenuEntry(value: 'Buğulama', label: 'Buğulama'),
    DropdownMenuEntry(value: 'Tost Makinesi', label: 'Tost Makinesi'),
    DropdownMenuEntry(value: 'Airfryer', label: 'Airfryer'),
    DropdownMenuEntry(value: 'Hiçbiri', label: 'Hiçbiri'),
  ];
  static const List<DropdownMenuEntry<String>> worldKitchenDropList = [
    DropdownMenuEntry(value: 'Turkish', label: 'Turkish'),
    DropdownMenuEntry(value: 'Italian', label: 'Italian'),
    DropdownMenuEntry(value: 'Tunisian', label: 'Tunisian'),
    DropdownMenuEntry(value: 'French', label: 'French'),
    DropdownMenuEntry(value: 'Japanese', label: 'Japanese'),
    DropdownMenuEntry(value: 'Chinese', label: 'Chinese'),
    DropdownMenuEntry(value: 'Mexican', label: 'Mexican'),
    DropdownMenuEntry(value: 'Hiçbiri', label: 'Hiçbiri'),
  ];
}
