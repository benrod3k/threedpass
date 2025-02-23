import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/default_loading_dialog.dart';
import 'package:threedpass/core/widgets/error_page.dart';
import 'package:threedpass/features/accounts/router/create_account_page_route.dart';
import 'package:threedpass/features/accounts/router/import_account_page_route.dart';
import 'package:threedpass/features/home_page/router/home_page_route.dart';
import 'package:threedpass/features/preview_page/router/preview_page_route.dart';
import 'package:threedpass/features/scan_page/router/calc_hash_loading_widget_route.dart';
import 'package:threedpass/features/web_wallet/router/web_wallet_route.dart';

// part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // Root route with bottom bar
    homePageAutoRoute,
    // Preview snapshots
    previewPageRoute,
    // web wallet page
    webWalletPageRoute,

    // Error page route
    errorPageRoute,

    // Create account route
    createAccountPageRoute,
    // Import account route
    importAccountPageRoute,

    // Loader for scan page
    calcHashLoadingWidgetRoute,
    // Default loader
    defaultLoadingDialog,
  ],
)
class $AppRouter {}

Route<T> dialogBuilder<T>(
  BuildContext context,
  Widget child,
  CustomPage<T> page,
) {
  return DialogRoute(
    context: context,
    builder: (context) => child,
    settings: page,
    barrierDismissible: false,
  );
}
