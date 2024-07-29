import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

class HeroEmptyRouterPage extends StatelessWidget {
  const HeroEmptyRouterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeroControllerScope(
      controller: HeroController(),
      child: const AutoRouter(),
    );
  }
}
