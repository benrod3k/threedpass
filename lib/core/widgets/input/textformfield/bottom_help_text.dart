part of 'textformfield.dart';

class _BottomHelpText extends StatelessWidget {
  const _BottomHelpText(this.bottomHelpText);

  final String? bottomHelpText;

  @override
  Widget build(BuildContext context) {
    return bottomHelpText != null
        ? Padding(
            padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
            child: Text(
              bottomHelpText!,
              style: Theme.of(context).textTheme.caption,
            ),
          )
        : const SizedBox();
  }
}
