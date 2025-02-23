import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';

class ConnectionIndicator extends StatelessWidget {
  const ConnectionIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppServiceLoaderCubit, AppService>(
      builder: (context, state) {
        switch (state.status) {
          case AppServiceInitStatus.init:
          case AppServiceInitStatus.connecting:
            return const _SmallCircle(
              color: Colors.orange,
            );
          case AppServiceInitStatus.connected:
            return const _SmallCircle(
              color: Colors.green,
            );
          case AppServiceInitStatus.error:
            return const _SmallCircle(
              color: Colors.red,
            );
        }
      },
    );
  }
}

class _SmallCircle extends StatelessWidget {
  const _SmallCircle({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
