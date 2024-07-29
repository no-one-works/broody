import 'package:broody/core/constants/box_keys.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info/package_info.dart';
import 'package:version/version.dart';

abstract class VersionDatasource {
  Future<Version> getVersion();

  Version getLastSeen();

  void setLastSeen(Version version);
}

final versionDatasourceProvider =
    Provider<VersionDatasource>((ref) => VersionDatasourceImpl());

class VersionDatasourceImpl implements VersionDatasource {
  late final Box<String> _box = Hive.box<String>(versionBoxKey);

  Future<Version> getVersion() async {
    final info = await PackageInfo.fromPlatform();
    return Version.parse(info.version);
  }

  Version getLastSeen() {
    return Version.parse(_box.get(versionBoxKey) ?? "1.0.0");
  }

  void setLastSeen(Version version) {
    _box.put(versionBoxKey, version.toString());
  }
}
