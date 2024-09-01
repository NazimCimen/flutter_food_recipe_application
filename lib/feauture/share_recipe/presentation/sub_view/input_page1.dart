part of '../view/share_recipe_view.dart';

//// FIX  IMPORTANT  .. CROPLASAN BİLE ÖLÇEĞİ AZALTINCA IMAGE ALANA SIĞMIYOR.
/////  add crash analatics for image picking and croping...
class InputPage1 extends StatefulWidget {
  const InputPage1({
    required this.pageController,
    super.key,
  });
  final PageController pageController;

  @override
  State<InputPage1> createState() => _InputPage1State();
}

class _InputPage1State extends State<InputPage1> with InputPage1Mixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.dynamicHeight(0.8),
          child: SingleChildScrollView(
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
                      validator: (value) =>
                          validators.recipeNameValidator(value),
                    ),
                    SizedBox(height: context.dynamicHeight(0.035)),
                    CustomInputField(
                      hintText: 'Description',
                      maxLines: 4,
                      controller: recipeDescriptionController,
                      validator: (value) =>
                          validators.recipeNameValidator(value),
                    ),
                    SizedBox(height: context.dynamicHeight(0.035)),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: context.paddingAllMedium,
              child: Align(
                alignment: Alignment.bottomRight,
                child: CustomButtonWidget(
                  context: context,
                  text: 'NEXT',
                  onPressed: nextPage,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
