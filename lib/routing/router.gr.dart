// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter(
      {GlobalKey<NavigatorState>? navigatorKey,
      required this.noProjectsGuard,
      required this.noSelectedProjectGuard,
      required this.noPermissionsGuard,
      required this.outdatedEntriesGuard})
      : super(navigatorKey);

  final NoProjectsGuard noProjectsGuard;

  final NoSelectedProjectGuard noSelectedProjectGuard;

  final NoPermissionsGuard noPermissionsGuard;

  final OutdatedEntriesGuard outdatedEntriesGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    ProjectsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProjectsPage());
    },
    ProjectDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProjectDetailsRouteArgs>(
          orElse: () => const ProjectDetailsRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ProjectDetailsPage(
              key: args.key, projectToEdit: args.projectToEdit),
          fullscreenDialog: true);
    },
    OnboardingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const OnboardingPage());
    },
    EntryRoute.name: (routeData) {
      final args = routeData.argsAs<EntryRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: EntryPage(
              key: args.key,
              entry: args.entry,
              projectId: args.projectId,
              date: args.date),
          fullscreenDialog: true,
          transitionsBuilder: fadeThroughTransition,
          durationInMilliseconds: 500,
          opaque: false,
          barrierDismissible: false);
    },
    VideoPickerRoute.name: (routeData) {
      final args = routeData.argsAs<VideoPickerRouteArgs>(
          orElse: () => const VideoPickerRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: VideoPickerPage(key: args.key, forDate: args.forDate));
    },
    LoadingFromCloudRoute.name: (routeData) {
      final args = routeData.argsAs<LoadingFromCloudRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: LoadingFromCloudPage(
              key: args.key, assetEntity: args.assetEntity),
          fullscreenDialog: true,
          transitionsBuilder: fadeThroughTransitionTransparent,
          opaque: true,
          barrierDismissible: false);
    },
    CreateCompilationRoute.name: (routeData) {
      final args = routeData.argsAs<CreateCompilationRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: CreateCompilationPage(
              projectUid: args.projectUid, month: args.month, key: args.key),
          fullscreenDialog: true,
          transitionsBuilder: fadeThroughTransitionTransparent,
          opaque: true,
          barrierDismissible: false);
    },
    VideoFullScreenRoute.name: (routeData) {
      final args = routeData.argsAs<VideoFullScreenRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child:
              VideoFullScreenPage(key: args.key, controller: args.controller),
          fullscreenDialog: true,
          transitionsBuilder: fadeThroughTransitionTransparent,
          opaque: false,
          barrierDismissible: false);
    },
    VideoEditorRoute.name: (routeData) {
      final args = routeData.argsAs<VideoEditorRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: VideoEditorPage(assetEntity: args.assetEntity, key: args.key),
          fullscreenDialog: true,
          transitionsBuilder: fadeThroughTransitionTransparent,
          opaque: false,
          barrierDismissible: false);
    },
    UpdateEntriesRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateEntriesRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: UpdateEntriesPage(key: args.key, project: args.project),
          fullscreenDialog: true,
          transitionsBuilder: fadeThroughTransitionTransparent,
          opaque: false,
          barrierDismissible: false);
    },
    MonthCompleteInfoRoute.name: (routeData) {
      final args = routeData.argsAs<MonthCompleteInfoRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: MonthCompleteInfoPage(key: args.key, month: args.month),
          fullscreenDialog: true,
          transitionsBuilder: fadeThroughTransitionTransparent,
          opaque: false,
          barrierDismissible: false);
    },
    NoPermissionInfoRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const NoPermissionInfoPage(),
          fullscreenDialog: true,
          transitionsBuilder: fadeThroughTransitionTransparent,
          opaque: false,
          barrierDismissible: false);
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/', guards: [
          noProjectsGuard,
          noSelectedProjectGuard,
          noPermissionsGuard,
          outdatedEntriesGuard
        ]),
        RouteConfig(ProjectsRoute.name,
            path: '/projects', guards: [noPermissionsGuard, noProjectsGuard]),
        RouteConfig(ProjectDetailsRoute.name,
            path: '/new-project', guards: [noPermissionsGuard]),
        RouteConfig(OnboardingRoute.name, path: '/welcome'),
        RouteConfig(EntryRoute.name, path: '/entry'),
        RouteConfig(VideoPickerRoute.name, path: '/pick'),
        RouteConfig(LoadingFromCloudRoute.name, path: '/load'),
        RouteConfig(CreateCompilationRoute.name, path: '/export'),
        RouteConfig(VideoFullScreenRoute.name, path: '/view-export'),
        RouteConfig(VideoEditorRoute.name, path: '/edit'),
        RouteConfig(UpdateEntriesRoute.name, path: '/update-entries'),
        RouteConfig(MonthCompleteInfoRoute.name, path: '/month-complete'),
        RouteConfig(NoPermissionInfoRoute.name, path: '/no-permission')
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [ProjectsPage]
class ProjectsRoute extends PageRouteInfo<void> {
  const ProjectsRoute() : super(ProjectsRoute.name, path: '/projects');

  static const String name = 'ProjectsRoute';
}

/// generated route for
/// [ProjectDetailsPage]
class ProjectDetailsRoute extends PageRouteInfo<ProjectDetailsRouteArgs> {
  ProjectDetailsRoute({Key? key, String? projectToEdit})
      : super(ProjectDetailsRoute.name,
            path: '/new-project',
            args: ProjectDetailsRouteArgs(
                key: key, projectToEdit: projectToEdit));

  static const String name = 'ProjectDetailsRoute';
}

class ProjectDetailsRouteArgs {
  const ProjectDetailsRouteArgs({this.key, this.projectToEdit});

  final Key? key;

  final String? projectToEdit;

  @override
  String toString() {
    return 'ProjectDetailsRouteArgs{key: $key, projectToEdit: $projectToEdit}';
  }
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute() : super(OnboardingRoute.name, path: '/welcome');

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [EntryPage]
class EntryRoute extends PageRouteInfo<EntryRouteArgs> {
  EntryRoute(
      {Key? key,
      SavedEntry? entry,
      required String projectId,
      required DateTime date})
      : super(EntryRoute.name,
            path: '/entry',
            args: EntryRouteArgs(
                key: key, entry: entry, projectId: projectId, date: date));

  static const String name = 'EntryRoute';
}

class EntryRouteArgs {
  const EntryRouteArgs(
      {this.key, this.entry, required this.projectId, required this.date});

  final Key? key;

  final SavedEntry? entry;

  final String projectId;

  final DateTime date;

  @override
  String toString() {
    return 'EntryRouteArgs{key: $key, entry: $entry, projectId: $projectId, date: $date}';
  }
}

/// generated route for
/// [VideoPickerPage]
class VideoPickerRoute extends PageRouteInfo<VideoPickerRouteArgs> {
  VideoPickerRoute({Key? key, DateTime? forDate})
      : super(VideoPickerRoute.name,
            path: '/pick',
            args: VideoPickerRouteArgs(key: key, forDate: forDate));

  static const String name = 'VideoPickerRoute';
}

class VideoPickerRouteArgs {
  const VideoPickerRouteArgs({this.key, this.forDate});

  final Key? key;

  final DateTime? forDate;

  @override
  String toString() {
    return 'VideoPickerRouteArgs{key: $key, forDate: $forDate}';
  }
}

/// generated route for
/// [LoadingFromCloudPage]
class LoadingFromCloudRoute extends PageRouteInfo<LoadingFromCloudRouteArgs> {
  LoadingFromCloudRoute({Key? key, required AssetEntity assetEntity})
      : super(LoadingFromCloudRoute.name,
            path: '/load',
            args:
                LoadingFromCloudRouteArgs(key: key, assetEntity: assetEntity));

  static const String name = 'LoadingFromCloudRoute';
}

class LoadingFromCloudRouteArgs {
  const LoadingFromCloudRouteArgs({this.key, required this.assetEntity});

  final Key? key;

  final AssetEntity assetEntity;

  @override
  String toString() {
    return 'LoadingFromCloudRouteArgs{key: $key, assetEntity: $assetEntity}';
  }
}

/// generated route for
/// [CreateCompilationPage]
class CreateCompilationRoute extends PageRouteInfo<CreateCompilationRouteArgs> {
  CreateCompilationRoute({required String projectUid, int? month, Key? key})
      : super(CreateCompilationRoute.name,
            path: '/export',
            args: CreateCompilationRouteArgs(
                projectUid: projectUid, month: month, key: key));

  static const String name = 'CreateCompilationRoute';
}

class CreateCompilationRouteArgs {
  const CreateCompilationRouteArgs(
      {required this.projectUid, this.month, this.key});

  final String projectUid;

  final int? month;

  final Key? key;

  @override
  String toString() {
    return 'CreateCompilationRouteArgs{projectUid: $projectUid, month: $month, key: $key}';
  }
}

/// generated route for
/// [VideoFullScreenPage]
class VideoFullScreenRoute extends PageRouteInfo<VideoFullScreenRouteArgs> {
  VideoFullScreenRoute({Key? key, required VideoPlayerController controller})
      : super(VideoFullScreenRoute.name,
            path: '/view-export',
            args: VideoFullScreenRouteArgs(key: key, controller: controller));

  static const String name = 'VideoFullScreenRoute';
}

class VideoFullScreenRouteArgs {
  const VideoFullScreenRouteArgs({this.key, required this.controller});

  final Key? key;

  final VideoPlayerController controller;

  @override
  String toString() {
    return 'VideoFullScreenRouteArgs{key: $key, controller: $controller}';
  }
}

/// generated route for
/// [VideoEditorPage]
class VideoEditorRoute extends PageRouteInfo<VideoEditorRouteArgs> {
  VideoEditorRoute({required AssetEntity assetEntity, Key? key})
      : super(VideoEditorRoute.name,
            path: '/edit',
            args: VideoEditorRouteArgs(assetEntity: assetEntity, key: key));

  static const String name = 'VideoEditorRoute';
}

class VideoEditorRouteArgs {
  const VideoEditorRouteArgs({required this.assetEntity, this.key});

  final AssetEntity assetEntity;

  final Key? key;

  @override
  String toString() {
    return 'VideoEditorRouteArgs{assetEntity: $assetEntity, key: $key}';
  }
}

/// generated route for
/// [UpdateEntriesPage]
class UpdateEntriesRoute extends PageRouteInfo<UpdateEntriesRouteArgs> {
  UpdateEntriesRoute({Key? key, required Project project})
      : super(UpdateEntriesRoute.name,
            path: '/update-entries',
            args: UpdateEntriesRouteArgs(key: key, project: project));

  static const String name = 'UpdateEntriesRoute';
}

class UpdateEntriesRouteArgs {
  const UpdateEntriesRouteArgs({this.key, required this.project});

  final Key? key;

  final Project project;

  @override
  String toString() {
    return 'UpdateEntriesRouteArgs{key: $key, project: $project}';
  }
}

/// generated route for
/// [MonthCompleteInfoPage]
class MonthCompleteInfoRoute extends PageRouteInfo<MonthCompleteInfoRouteArgs> {
  MonthCompleteInfoRoute({Key? key, required int month})
      : super(MonthCompleteInfoRoute.name,
            path: '/month-complete',
            args: MonthCompleteInfoRouteArgs(key: key, month: month));

  static const String name = 'MonthCompleteInfoRoute';
}

class MonthCompleteInfoRouteArgs {
  const MonthCompleteInfoRouteArgs({this.key, required this.month});

  final Key? key;

  final int month;

  @override
  String toString() {
    return 'MonthCompleteInfoRouteArgs{key: $key, month: $month}';
  }
}

/// generated route for
/// [NoPermissionInfoPage]
class NoPermissionInfoRoute extends PageRouteInfo<void> {
  const NoPermissionInfoRoute()
      : super(NoPermissionInfoRoute.name, path: '/no-permission');

  static const String name = 'NoPermissionInfoRoute';
}
