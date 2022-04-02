import 'package:flutter/material.dart';
import 'package:flutter_assignment_task/size_config.dart';

import 'animations/my_slide_animation.dart';

class MyElevatedButton extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final void Function()? onPressed;
  const MyElevatedButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: !isLoading ? onPressed : null,
        child: MySlideAnimation(
          key: UniqueKey(),
          child: isLoading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Loading...'),
                    SizedBox(width: 15),
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  ],
                )
              : child,
        ),
        style: ElevatedButton.styleFrom(
          elevation: 4,
          primary: const Color.fromARGB(255, 234, 234, 237),
          shadowColor: Theme.of(context).cardColor,
          shape: const StadiumBorder(),
          alignment: Alignment.center,
          padding: EdgeInsets.all(4.5.padding),
          onPrimary: theme.textTheme.subtitle1!.color,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            // color: Colors.white,
            // fontSize: 1.8.text,
            // color: theme.textTheme.subtitle1!.color,
          ),
        ),
        // textStyle: TextStyle(color: Colors.white),
        // minimumSize: Size(Responsive.width(87), Responsive.height(6)),
        // ),
      ),
    );
  }
}
