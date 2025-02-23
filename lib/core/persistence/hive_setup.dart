import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/preview_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/wallet_settings.dart';

Future<void> hiveSetup() async {
  Hive.registerAdapter<HashObject>(HashObjectAdapter());
  Hive.registerAdapter<Snapshot>(SnapshotAdapter());
  // settings
  Hive.registerAdapter<GlobalSettings>(GlobalSettingsAdapter());
  Hive.registerAdapter<ScanSettings>(ScanSettingsAdapter());
  Hive.registerAdapter<WalletSettings>(WalletSettingsAdapter());
  Hive.registerAdapter<PreviewSettings>(PreviewSettingsAdapter());
  Hive.registerAdapter<Algorithm>(AlgorithmAdapter());

  Directory defaultDirectory = await getApplicationDocumentsDirectory();
  Hive.init(defaultDirectory.path + '/storages');
}
