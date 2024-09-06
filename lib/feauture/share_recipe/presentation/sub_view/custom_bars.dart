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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
            Colors.transparent
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
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
              child: Icon(
                Icons.close_outlined,
                color: Theme.of(context).colorScheme.surface,
                shadows: [
                  Shadow(
                    offset: const Offset(1.5, 1.5),
                    blurRadius: 2,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.7),
                  ),
                ],
              ),
            ),
            Text(
              'Share Your Kitchen',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    shadows: CustomShadows.customLowShadow(),
                  ),
            ),
            Text(
              '$currentPage / $totalPage',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.surface,
                    fontWeight: FontWeight.bold,
                    shadows: CustomShadows.customLowShadow(),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
