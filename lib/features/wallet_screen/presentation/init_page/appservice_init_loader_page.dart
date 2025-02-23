import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/appbars/common_logo_appbar.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/connect_status.dart';
import 'package:threedpass/features/wallet_screen/presentation/widgets/open_web_wallet_card.dart';

class AppServiceInitLoaderPage extends StatelessWidget {
  const AppServiceInitLoaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonLogoAppbar(
        title: 'wallet_header_title'.tr(),
      ),
      body: Stack(
        children: const [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 16),
              child: OpenWebWalletCard(),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ConnectStatus(),
          ),
        ],
      ),
    );
  }
}
