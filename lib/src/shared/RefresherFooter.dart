import 'package:c_wire_app/src/shared/NoMoreDataMessage.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'LoadMoreMessage.dart';
import 'LoadingBar.dart';

class RefresherFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      builder: (BuildContext context, LoadStatus mode) {
        Widget body;

        if (mode == LoadStatus.loading) {
          body = LoadingBar();
        } else if (mode == LoadStatus.idle) {
          body = NoMoreDataMessage();
        } else if (mode == LoadStatus.canLoading) {
          body = LoadMoreMessage();
        }

        return Container(
          child: Center(child: body),
        );
      },
    );
  }
}
