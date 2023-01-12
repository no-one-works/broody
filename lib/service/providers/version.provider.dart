import 'package:broody/service/repositories/version.repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:version/version.dart';

final versionProvider = FutureProvider.autoDispose<Version>(
    (ref) => ref.watch(versionRepositoryProvider).getVersion());

final lastSeenVersionProvider = Provider.autoDispose<Version>(
    (ref) => ref.watch(versionRepositoryProvider).getLastSeen());
