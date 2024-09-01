part of '../view/share_recipe_view.dart';

//camera gallery permission
// share edilirken absorb pointer

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
    return Column(
      children: [
        SizedBox(
          height: context.dynamicHeight(0.8),
          child: Padding(
            padding: context.paddingHorizAllLarge,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _StepHeader(),
                Expanded(child: _StepList()),
                _AddStepButton(),
              ],
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonWidget(
                    context: context,
                    text: 'BACK',
                    onPressed: previousPage,
                  ),
                  CustomButtonWidget(
                    context: context,
                    text: 'SHARE',
                    onPressed: shareRecipe,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Adım ekleme butonu
class _AddStepButton extends StatelessWidget {
  const _AddStepButton();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ShareRecipeViewModel>();

    return Padding(
      padding: context.paddingAllLow,
      child: TextButton.icon(
        onPressed: () {
          if (viewModel.isCurrentStepValid()) {
            viewModel.addNewRecipeStep(
              step: RecipeStepEntity(
                id: const Uuid().v1(),
                stepNumber: viewModel.inputPage4Logic.steps.length + 1,
                stepDescription: '',
                stepImageUrl: '',
              ),
            );
            FocusScope.of(context).nextFocus();
          } else {
            CustomSnackBars.showRecipeScaffoldSnackBar(
              context: context,
              text: 'Lütfen mevcut adımı doldurun.',
            );
          }
        },
        icon: Icon(
          Icons.add,
          shadows: CustomShadows.customLowShadow(),
        ),
        label: Text(
          'Add Step',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              shadows: CustomShadows.customLowShadow(),
              color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}

// Step listesini oluşturur.
class _StepList extends StatelessWidget {
  const _StepList();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ShareRecipeViewModel>();
    final stepInputList = viewModel.inputPage4Logic.steps;

    return ListView.builder(
      itemCount: stepInputList.length,
      itemBuilder: (context, index) {
        final stepInputModel = stepInputList[index];
        return Padding(
          padding: context.paddingAllLow,
          child: Column(
            children: [
              _StepHeaderRow(step: stepInputModel),
              const SizedBox(height: 8),
              _StepImagePicker(step: stepInputModel),
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

  const _StepHeaderRow({required this.step, super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ShareRecipeViewModel>();

    return Row(
      children: [
        CircleAvatar(
          radius: 12,
          child: Text(
            '${step.stepEntity.stepNumber}',
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
            viewModel.removeRecipeStep(step);
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
    final viewModel = context.read<ShareRecipeViewModel>();

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
      onChanged: (value) {
        viewModel.updateRecipeStep(step, value);
      },
      maxLines: 3,
    );
  }
}

// Step resim seçici (kamera butonu)
class _StepImagePicker extends StatelessWidget {
  final RecipeStepInputModel step;

  const _StepImagePicker({required this.step, super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: CustomBoxDecoration.customBoxDecorationImageArea(context),
      child: AspectRatio(
        aspectRatio: ImageAspectRatio.stepAspectRatio.ratio,
        child: Center(
          child: IconButton(
            icon: Image.asset(
              ImageEnums.sharePostImage.toPathPng,
              width: context.dynamicWidht(0.2),
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {
              // Kamera işlemi buraya
            },
          ),
        ),
      ),
    );
  }
}

// Step başlığını ve ekleme butonunu içerir.
class _StepHeader extends StatelessWidget {
  const _StepHeader();

  @override
  Widget build(BuildContext context) {
    return const CustomTitleTextShadowWidget(text: 'Recipe Steps');
  }
}
