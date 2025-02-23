import 'package:flutter/material.dart';
import 'package:threedpass/common/app_text_styles.dart';
import 'package:threedpass/features/preview_page/bloc/preview_page_cubit.dart';

class SnapshotInfo extends StatelessWidget {
  const SnapshotInfo({
    Key? key,
    required this.state,
  }) : super(key: key);

  final PreviewPageCubitState state;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Snapshot: ',
        children: [
          TextSpan(
            text: state.snapshot.name,
            style: AppTextStyles.bodyText1.copyWith(
              fontStyle: FontStyle.normal,
            ),
          ),
        ],
      ),
      style: AppTextStyles.bodyText2.copyWith(
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
