import 'package:flutter/material.dart';
import 'package:flutter_assignment_task/size_config.dart';

class GenderWidget extends StatelessWidget {
  final void Function(String?)? onChanged;
  final String? defaultValue;
  const GenderWidget({
    Key? key,
    this.onChanged,
    this.defaultValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Row(
      children: [
        SizedBox(width: 5.width),
        Text(
          'Gender',
          style: theme.subtitle2,
        ),
        SizedBox(width: 10.width),
        Row(
          children: [
            const Text('Male'),
            Radio(
              value: 'MALE',
              groupValue: defaultValue,
              onChanged: onChanged,
            ),
          ],
        ),
        Row(
          children: [
            const Text('Female'),
            Radio(
              value: 'FEMALE',
              groupValue: defaultValue,
              onChanged: onChanged,
            ),
          ],
        ),
      ],
    );
  }
}