import 'package:auto_route/auto_route.dart';
import 'package:broody/core/hook/use_l10n.hook.dart';
import 'package:broody/core/hook/use_theme.hook.dart';
import 'package:broody/ui/shared/bouncy_pressable/bouncy_pressable.widget.dart';
import 'package:broody/ui/theme/spacing.dart';
import 'package:broody/ui/whats_new/widgets/changelog_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sliver_tools/sliver_tools.dart';

class WhatsNewPage extends HookConsumerWidget {
  const WhatsNewPage({
    super.key,
    required this.items,
  });
  final List<ChangelogItem> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final theme = useTheme();
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
              ),
              SliverPadding(
                padding: EdgeInsets.all(Spacers.l),
                sliver: MultiSliver(
                  children: [
                    Center(
                      child: Text(
                        l10n.whatsNew,
                        style: theme.textTheme.displaySmall,
                      ),
                    ),
                    vSpace(Spacers.x2l),
                    for (final item in items) ...[
                      item.buildWidget(context, l10n),
                      vSpace(Spacers.x2l),
                    ],
                    vSpace(Spacers.x4l),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: Spacers.l,
            left: Spacers.l,
            right: Spacers.l,
            child: SafeArea(
              top: false,
              child: BouncyPressable(
                child: CupertinoButton(
                  color: theme.colorScheme.primary,
                  onPressed: context.router.popForced,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        l10n.continueBtn,
                        style: theme.textTheme.button!
                            .copyWith(color: theme.colorScheme.onPrimary),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
