import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';

class HashCardPopUpMenuButton extends StatelessWidget {
  const HashCardPopUpMenuButton({
    Key? key,
    required this.snapshot,
    required this.hashObject,
  }) : super(key: key);

  final Snapshot snapshot;
  final HashObject hashObject;

  void onSelected(int? value, BuildContext context) {
    switch (value) {
      case 1:
        Share.share(snapshot.hashes.join('\n'));
        break;
      case 2:
        BlocProvider.of<HashesListBloc>(context).add(
          DeleteHash(
            hash: snapshot,
            object: hashObject,
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert, color: Colors.grey),
      onSelected: (int? value) => onSelected(value, context),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                child: Icon(Icons.share, color: Colors.grey),
              ),
              Text('Share'.tr()),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                child: Icon(Icons.delete, color: Colors.grey),
              ),
              Text('Delete'.tr()),
            ],
          ),
        ),
      ],
    );
  }
}
