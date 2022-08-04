import 'package:auto_route/auto_route.dart';
import 'package:broody/routing/route_guards/no_permissions.guard.dart';
import 'package:broody/routing/route_guards/no_selected_project.guard.dart';
import 'package:broody/routing/route_guards/outdated_entries.guard.dart';
import 'package:broody/routing/router.gr.dart';
import 'package:broody/ui/creating_compilation/create_compilation.page.dart';
import 'package:broody/ui/creating_compilation/pages/video_full_screen.page.dart';
import 'package:broody/ui/entry/entry.page.dart';
import 'package:broody/ui/home/home.page.dart';
import 'package:broody/ui/info/month_complete_info.page.dart';
import 'package:broody/ui/info/no_permission_info.page.dart';
import 'package:broody/ui/loading_from_cloud/loading_from_cloud.page.dart';
import 'package:broody/ui/onboarding/onboarding.page.dart';
import 'package:broody/ui/project/projects.page.dart';
import 'package:broody/ui/project_details/project_details.page.dart';
import 'package:broody/ui/theme/transitions.dart';
import 'package:broody/ui/update_entries/update_entries.page.dart';
import 'package:broody/ui/video_editor/video_editor.page.dart';
import 'package:broody/ui/video_picker/video_picker.page.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'route_guards/no_projects.guard.dart';

export 'package:auto_route/auto_route.dart';

export 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: "/",
      page: HomePage,
      initial: true,
      guards: [
        NoProjectsGuard,
        NoSelectedProjectGuard,
        NoPermissionsGuard,
        OutdatedEntriesGuard
      ],
    ),
    AutoRoute(
      path: "/projects",
      page: ProjectsPage,
      guards: [NoPermissionsGuard, NoProjectsGuard],
    ),
    AutoRoute(
      path: "/new-project",
      page: ProjectDetailsPage,
      fullscreenDialog: true,
      guards: [NoPermissionsGuard],
    ),
    AutoRoute(
      path: "/welcome",
      page: OnboardingPage,
    ),
    CustomRoute(
      path: "/entry",
      page: EntryPage,
      fullscreenDialog: true,
      transitionsBuilder: fadeThroughTransition,
      durationInMilliseconds: 500,
      opaque: false,
    ),
    AutoRoute(
      path: "/pick",
      page: VideoPickerPage,
    ),
    CustomRoute(
      path: "/load",
      page: LoadingFromCloudPage,
      transitionsBuilder: fadeThroughTransitionTransparent,
      fullscreenDialog: true,
    ),
    CustomRoute(
      path: "/export",
      page: CreateCompilationPage,
      transitionsBuilder: fadeThroughTransitionTransparent,
      fullscreenDialog: true,
    ),
    CustomRoute(
      path: "/view-export",
      page: VideoFullScreenPage,
      transitionsBuilder: fadeThroughTransitionTransparent,
      fullscreenDialog: true,
      opaque: false,
    ),
    CustomRoute(
      path: "/edit",
      page: VideoEditorPage,
      transitionsBuilder: fadeThroughTransitionTransparent,
      fullscreenDialog: true,
      opaque: false,
    ),
    CustomRoute(
      path: "/update-entries",
      page: UpdateEntriesPage,
      transitionsBuilder: fadeThroughTransitionTransparent,
      fullscreenDialog: true,
      opaque: false,
    ),
    CustomRoute(
      path: "/month-complete",
      page: MonthCompleteInfoPage,
      transitionsBuilder: fadeThroughTransitionTransparent,
      fullscreenDialog: true,
      opaque: false,
    ),
    CustomRoute(
      path: "/no-permission",
      page: NoPermissionInfoPage,
      transitionsBuilder: fadeThroughTransitionTransparent,
      fullscreenDialog: true,
      opaque: false,
    ),
  ],
)
class $AppRouter extends AppRouter {
  $AppRouter(Reader reader)
      : super(
          noProjectsGuard: NoProjectsGuard(reader),
          noSelectedProjectGuard: NoSelectedProjectGuard(reader),
          noPermissionsGuard: NoPermissionsGuard(),
          outdatedEntriesGuard: OutdatedEntriesGuard(reader),
        );
}

final routerProvider = Provider((ref) => $AppRouter(ref.read));

class DebugRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    print('New route pushed: ${route.settings.name}');
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    print('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    print('Tab route re-visited: ${route.name}');
  }
}
