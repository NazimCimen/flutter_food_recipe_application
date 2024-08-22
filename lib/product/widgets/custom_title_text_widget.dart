import 'package:flutter/material.dart';

class CustomTitleTextWidget extends StatelessWidget {
  final String text;
  const CustomTitleTextWidget({
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
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}

class CustomSubTitleTextWidget extends StatelessWidget {
  final String text;
  const CustomSubTitleTextWidget({
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
