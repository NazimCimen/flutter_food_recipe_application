import 'package:flutter/material.dart';

class HomeCustomTitleTextWidget extends StatelessWidget {
  final String text;
  const HomeCustomTitleTextWidget({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(fontWeight: FontWeight.w700),
    );
  }
}

class HomeCustomSubTitleTextWidget extends StatelessWidget {
  final String text;
  const HomeCustomSubTitleTextWidget({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
    );
  }
}
