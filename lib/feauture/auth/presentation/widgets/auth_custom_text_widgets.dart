import 'package:flutter/material.dart';

class AuthCustomTitleTextWidget extends StatelessWidget {
  final String text;
  const AuthCustomTitleTextWidget({
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

class AuthCustomSubTitleTextWidget extends StatelessWidget {
  final String text;
  const AuthCustomSubTitleTextWidget({
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
