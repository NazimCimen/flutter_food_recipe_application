part of '../view/share_recipe_view.dart';

// InputPage4 widget'ı: Paylaşım adımları sayfası
class InputPage4 extends StatefulWidget {
  final PageController pageController;

  const InputPage4({
    required this.pageController,
    super.key,
  });

  @override
  State<InputPage4> createState() => _InputPage4State();
}

class _InputPage4State extends State<InputPage4> with InputPage4Mixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShareRecipeViewModel>(
      builder: (context, viewmodel, child) {
        return viewmodel.isLoading
            ? const ShareRecipeLoadingWidget()
            : Column(
                children: [
                  _RecipeStepsContainer(
                    steps: steps,
                    addNewStep: addNewStep,
                    removeStep: removeStep,
                    getStepImageFile: getStepImageFile,
                  ),
                  BottomActionBar(
                    previousPagebutton: previousPage,
                    nextOrShareButton: shareRecipe,
                    nextOrShareBtnText: 'SHARE',
                    previousPageBtnText: 'BACK',
                  ),
                ],
              );
      },
    );
  }
}

// Tarif adımlarını ve adım ekleme butonunu içerir
class _RecipeStepsContainer extends StatelessWidget {
  final List<RecipeStepInputModel> steps;
  final VoidCallback addNewStep;
  final void Function(int index) removeStep;
  final void Function(int index) getStepImageFile;

  const _RecipeStepsContainer({
    required this.steps,
    required this.addNewStep,
    required this.removeStep,
    required this.getStepImageFile,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.8),
      child: Padding(
        padding: context.paddingHorizAllLarge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _StepHeader(),
            Expanded(
              child: _StepList(
                stepInputs: steps,
                removeStep: removeStep,
                getStepImageFile: getStepImageFile,
              ),
            ),
            AddStepButton(
              addButton: addNewStep,
              btnText: 'Add Step',
            ),
          ],
        ),
      ),
    );
  }
}

// Adım listesini oluşturur
class _StepList extends StatelessWidget {
  final List<RecipeStepInputModel> stepInputs;
  final void Function(int index) removeStep;
  final void Function(int index) getStepImageFile;

  const _StepList({
    required this.stepInputs,
    required this.removeStep,
    required this.getStepImageFile,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      itemCount: stepInputs.length,
      itemBuilder: (context, index) {
        final stepInputModel = stepInputs[index];
        return Padding(
          padding: context.paddingAllLow,
          child: Column(
            children: [
              _StepHeaderRow(
                step: stepInputModel,
                removeStep: removeStep,
                index: index,
              ),
              const SizedBox(height: 8),
              _StepImagePicker(
                step: stepInputModel,
                getStepImage: getStepImageFile,
                index: index,
              ),
              const SizedBox(height: 8),
              _StepDescriptionField(step: stepInputModel),
            ],
          ),
        );
      },
    );
  }
}

// Step başlığı ve silme butonu
class _StepHeaderRow extends StatelessWidget {
  final RecipeStepInputModel step;
  final void Function(int index) removeStep;
  final int index;

  const _StepHeaderRow({
    required this.step,
    required this.removeStep,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 12,
          child: Text(
            '${index + 1}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.surface,
                  shadows: CustomShadows.customLowShadow(),
                ),
          ),
        ),
        const CustomTitleTextShadowWidget(text: '  Define Your Step'),
        const Spacer(),
        IconButton(
          onPressed: () {
            removeStep(index);
          },
          icon: Icon(
            Icons.delete_outline,
            color: Theme.of(context).colorScheme.surface,
            shadows: CustomShadows.customLowShadow(),
          ),
        ),
      ],
    );
  }
}

// Step açıklama girişi
class _StepDescriptionField extends StatelessWidget {
  final RecipeStepInputModel step;

  const _StepDescriptionField({required this.step});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.surface,
            fontWeight: FontWeight.bold,
            shadows: CustomShadows.customLowShadow(),
          ),
      focusNode: step.focusNode,
      controller: step.controller,
      decoration: CustomInputDecoration.inputDecoration(
        context: context,
        hintText: 'Tell a little about your food',
      ),
      maxLines: 3,
    );
  }
}

// Step resim seçici (kamera butonu)
class _StepImagePicker extends StatelessWidget {
  final RecipeStepInputModel step;
  final void Function(int index) getStepImage;
  final int index;

  const _StepImagePicker({
    required this.getStepImage,
    required this.step,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: CustomBoxDecoration.customBoxDecorationImageArea(context),
      child: AspectRatio(
        aspectRatio: ImageAspectRatio.stepAspectRatio.ratio,
        child: Builder(
          builder: (context) {
            if (step.loading) {
              return const CustomProgressIndicator();
            } else if (step.stepImageFile != null) {
              return CustomShowCroppedImageWidget(
                imageFile: step.stepImageFile!,
              );
            } else {
              return Center(
                child: IconButton(
                  icon: Image.asset(
                    ImageEnums.sharePostImage.toPathPng,
                    width: context.dynamicWidht(0.2),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () async {
                    getStepImage(index);
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

// Step başlığını içerir
class _StepHeader extends StatelessWidget {
  const _StepHeader();

  @override
  Widget build(BuildContext context) {
    return const CustomTitleTextShadowWidget(text: 'Recipe Steps');
  }
}
