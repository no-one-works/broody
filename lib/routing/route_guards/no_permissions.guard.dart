import 'package:auto_route/auto_route.dart';
import 'package:broody/routing/router.dart';
import 'package:photo_manager/photo_manager.dart';

class NoPermissionsGuard extends AutoRouteGuard {
  NoPermissionsGuard();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final permission = await PhotoManager.requestPermissionExtend();
    if (permission.isAuth) {
      resolver.next(true);
    } else {
      resolver.next(false);
      await router.push(const NoPermissionInfoRoute());
    }
  }
}
