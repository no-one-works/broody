import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:blur/blur.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/ui/home/widgets/home_dropdown.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeAppBar extends HookWidget {
  const HomeAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = useTextTheme();
    final colorScheme = useColorScheme();
    return SliverAppBar(
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: Spacers.m, top: Spacers.s),
          child: HomeDropdown(),
        )
      ],
      title: AutoSizeText(
        title,
        style: textTheme.headline4,
        maxLines: 1,
        minFontSize: 20,
      ),
      flexibleSpace: Platform.isIOS
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Divider(
                  height: 1,
                ),
              ],
            ).frosted(
              blur: 24,
              frostColor: colorScheme.background,
            )
          : Container(
              color: colorScheme.background,
            ),
      leadingWidth: Spacers.x2l,
      floating: !Platform.isIOS,
      pinned: Platform.isIOS,
    );
  }
}
