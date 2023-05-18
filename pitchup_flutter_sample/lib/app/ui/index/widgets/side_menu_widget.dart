import 'package:argo/argo.dart';
import 'package:pitchupfluttersample/app/presenter/index_page_provider.dart';
import 'package:pitchupfluttersample/app/ui/core/header_item_uim.dart';
import 'package:pitchupfluttersample/app/ui/pages/login_page.dart';
import 'package:pitchupfluttersample/config/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../mysql/mysql.dart';
import 'menu_item_widget.dart';

class SideMenuWidget extends StatelessWidget {
  SideMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sideMenuItems = context
        .select<IndexPageProvider, List<HeaderItemUIModel>>((it) => it.items);

    return Container(
      padding: EdgeInsets.only(top: PlatformInfo.isWeb ? kSpaceMedium : 0),
      height: context.heightPx,
      color: kBgLightColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: kSpaceMedium),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Text(''),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/logo.png'),
                      radius: 30,
                    ),
                  ],
                ),
              ),
              kSpaceBigVertical,
              ...sideMenuItems
                  .map((item) => SideMenuItemWidget(
                        item: item,
                        showBorder: sideMenuItems.last.id != item.id,
                      ))
                  .toList(),

              // Tags
            ],
          ),
        ),
      ),
    );
  }
}
