import 'package:broody/service/datasources/version/version.datasource.dart';
import 'package:broody/service/repositories/repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:version/version.dart';

abstract class VersionRepository {
  Future<Version> getVersion();

  Version getLastSeen();

  void setLastSeen(Version version);
}

final versionRepositoryProvider =
    Provider<VersionRepository>((ref) => VersionRepositoryImpl(ref));

class VersionRepositoryImpl extends RepositoryBase
    implements VersionRepository {
  VersionRepositoryImpl(super.ref);

  Future<Version> getVersion() =>
      ref.read(versionDatasourceProvider).getVersion();

  Version getLastSeen() => ref.read(versionDatasourceProvider).getLastSeen();

  void setLastSeen(Version version) =>
      ref.read(versionDatasourceProvider).setLastSeen(version);
}
