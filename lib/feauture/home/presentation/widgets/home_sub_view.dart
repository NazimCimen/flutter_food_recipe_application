part of '../view/home_view.dart';

class _BuildWorldKitchen extends StatelessWidget {
  const _BuildWorldKitchen();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.paddingHorizAllMedium,
          child: const HomeCustomTitleTextWidget(text: 'World Kitchen'),
        ),
        SizedBox(
          height: context.dynamicHeight(0.08),
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: context.paddingAllMedium,
              child: Chip(
                backgroundColor: Theme.of(context).colorScheme.onTertiary,
                label: const HomeCustomSubTitleTextWidget(
                  text: 'Türk Mutfağı',
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: context.dynamicWidht(0.7),
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: context.paddingHorizAllMedium,
              child: Container(
                width: context.dynamicWidht(0.7),
                decoration: BoxDecoration(
                  borderRadius: context.borderRadiusAllMedium,
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BuildPopularRecipes extends StatelessWidget {
  const _BuildPopularRecipes();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.paddingHorizAllMedium,
          child: const HomeCustomTitleTextWidget(text: 'Popular Recipes'),
        ),
        SizedBox(height: context.dynamicHeight(0.01)),
        SizedBox(
          height: context.dynamicWidht(0.7),
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: context.paddingHorizAllMedium,
              child: Container(
                width: context.dynamicWidht(0.7),
                decoration: BoxDecoration(
                  borderRadius: context.borderRadiusAllMedium,
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BuildSearchField extends StatelessWidget {
  const _BuildSearchField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHorizAllMedium,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Recipes',
          prefixIcon: Icon(
            Icons.search_outlined,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
          border: OutlineInputBorder(
            borderRadius: context.borderRadiusAllMedium,
            borderSide: BorderSide(
              width: 2,
              color: Theme.of(context).colorScheme.onTertiary,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: context.borderRadiusAllMedium,
            borderSide: BorderSide(
              width: 2,
              color: Theme.of(context).colorScheme.onTertiary,
            ),
          ),
        ),
      ),
    );
  }
}

class _BuildHeader extends StatelessWidget {
  const _BuildHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHorizAllMedium,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeCustomSubTitleTextWidget(text: '👋 Welcome'),
              HomeCustomTitleTextWidget(text: 'Nazım Çimen'),
            ],
          ),
          const Spacer(),
          IconButton.filled(
            hoverColor: Theme.of(context).colorScheme.secondary,
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
    );
  }
}
