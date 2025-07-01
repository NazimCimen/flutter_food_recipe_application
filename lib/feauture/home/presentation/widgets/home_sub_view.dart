part of '../view/home_view.dart';

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
  final User? user;

  const _BuildHeader({required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHorizAllMedium,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeCustomTitleTextWidget(text: '👋 Welcome'),
              Padding(
                padding: context.paddingVertTopLow,
                child: Row(
                  children: [
                    /*  CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage(
                        // user null kontrolü
                        user?.photoURL ??
                            'https://firebasestorage.googleapis.com/v0/b/flutter-recipe-app-af800.appspot.com/o/WhatsApp%20Image%202024-07-22%20at%2015.46.24.jpeg?alt=media&token=eb9ad6cb-c1da-48d6-bdfa-02ffe9d2f297',
                      ), // Profil resmi URL'si
                    ),*/
                    SizedBox(width: 5),
                    HomeCustomTitleTextWidget(
                      text: //user?.displayName ??
                          'Nazım Çimen',
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              // user null kontrolü
              user?.photoURL ??
                  'https://firebasestorage.googleapis.com/v0/b/flutter-recipe-app-af800.appspot.com/o/WhatsApp%20Image%202024-07-22%20at%2015.46.24.jpeg?alt=media&token=eb9ad6cb-c1da-48d6-bdfa-02ffe9d2f297',
            ), // Profil resmi URL'si
          ),
          /*    IconButton.filled(
            hoverColor: Theme.of(context).colorScheme.secondary,
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),*/
        ],
      ),
    );
  }
}

class _FoodCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: AspectRatio(
                aspectRatio: 1, // 1:1 oranı sağlar
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/flutter-recipe-app-af800.appspot.com/o/2.png?alt=media&token=53aa5fcb-fd8c-4628-8ae4-90dce1a00a2a',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Egg Pasta',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Spicy Chicken Pasta',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '5.0',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    '\$15.00',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FoodCard2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/flutter-recipe-app-af800.appspot.com/o/2.png?alt=media&token=53aa5fcb-fd8c-4628-8ae4-90dce1a00a2a', // Buraya gerçek bir resim URL'si ekleyin
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Egg Pasta',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Spicy Chicken Pasta',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '5.0',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    '\$15.00',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
