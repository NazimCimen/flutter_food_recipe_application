part of '../view/share_recipe_view.dart';

//// FIX  IMPORTANT  .. CROPLASAN BİLE ÖLÇEĞİ AZALTINCA IMAGE ALANA SIĞMIYOR.
/////  add crash analatics for image picking and croping...
class _InputPage1 extends StatelessWidget {
  const _InputPage1({
    required this.page1FormKey,
    required this.recipeNameController,
    required this.validators,
    required this.recipeDescriptionController,
  });

  final GlobalKey<FormState> page1FormKey;
  final TextEditingController recipeNameController;
  final AppValidators validators;
  final TextEditingController recipeDescriptionController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: page1FormKey,
        child: Padding(
          padding: context.paddingHorizAllLarge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.dynamicHeight(0.02)),
              const AddRecipeImageWidget(),
              SizedBox(height: context.dynamicHeight(0.035)),
              CustomInputField(
                hintText: 'Food Name',
                maxLines: 1,
                controller: recipeNameController,
                validator: (value) => validators.recipeNameValidator(value),
              ),
              SizedBox(height: context.dynamicHeight(0.035)),
              CustomInputField(
                hintText: 'Description',
                maxLines: 4,
                controller: recipeDescriptionController,
                validator: (value) => validators.recipeNameValidator(value),
              ),
              SizedBox(height: context.dynamicHeight(0.035)),
            ],
          ),
        ),
      ),
    );
  }
}
