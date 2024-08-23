part of '../view/share_recipe_view.dart';

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentPage;
  final int totalPage;
  const _CustomAppBar({
    required this.currentPage,
    required this.totalPage,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              context.read<ShareRecipeViewModel>().reset();
              NavigatorService.pushNamedAndRemoveUntil(
                AppRoutes.navBarView,
              );
            },
            child: const Icon(
              Icons.close_outlined,
            ),
          ),
          TextButton(
            child: Text(
              '$currentPage / $totalPage',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomBottomNavigationBar extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final PageController pageController;
  final VoidCallback nextPage;
  final VoidCallback previousPage;
  final VoidCallback shareRecipe;
  const _CustomBottomNavigationBar({
    required this.currentPage,
    required this.totalPages,
    required this.pageController,
    required this.nextPage,
    required this.previousPage,
    required this.shareRecipe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllMedium,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentPage != 0)
            _bottomButton(
              context: context,
              onPressed: previousPage,
              text: 'BACK',
            ),
          const Spacer(),
          if (currentPage + 1 < totalPages)
            _bottomButton(
              context: context,
              onPressed: nextPage,
              text: 'NEXT',
            ),
          if (currentPage + 1 == totalPages)
            _bottomButton(
              context: context,
              onPressed: shareRecipe,
              text: 'SHARE',
            ),
        ],
      ),
    );
  }

  ElevatedButton _bottomButton({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        shape: ContinuousRectangleBorder(
          borderRadius: context.borderRadiusAllMedium,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}
