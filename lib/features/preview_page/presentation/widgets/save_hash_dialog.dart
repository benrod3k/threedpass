import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/preview_page/bloc/outer_context_cubit.dart';
import 'package:threedpass/features/preview_page/presentation/widgets/dialogs/common_dialog.dart';
import 'package:threedpass/router/route_names.dart';

class SaveHashDialog extends StatelessWidget {
  const SaveHashDialog({
    Key? key,
    required this.snapshot,
    required this.hashObject,
  }) : super(key: key);

  final HashObject hashObject;
  final Snapshot snapshot;

  Future<void> saveSnapshot(String name, BuildContext context) async {
    final newNamedModel = snapshot.copyWith(name: name);

    BlocProvider.of<HashesListBloc>(context).add(
      SaveSnapshot(
        hash: newNamedModel,
        object: hashObject,
      ),
    );

    final outerContext = BlocProvider.of<OuterContextCubit>(context).state;
    outerContext.router.popUntilRouteWithName(RouteNames.homePage);

    // outerContext.router.push(
    //   PreviewWrapperRoute(
    //     hashObject: hashObject,
    //     snapshot: newNamedModel,
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return CommonDialog(
      snapshot: snapshot,
      hashObject: hashObject,
      initialText: snapshot.name,
      title: 'save_snapshot_title'.tr(),
      actionText: 'Save'.tr(),
      action: (value) => saveSnapshot(value, context),
    );
  }
}
