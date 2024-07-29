import 'package:riverpod/riverpod.dart';

/// Repositories are higher-level services that depend on [Datasource]s or other
/// Repositories to combine their functionalities into logical operations.
///
/// Example: An ``AuthenticationRepository`` exposes a ``signUp()`` method that
/// uses an ``AuthenticationDatasource`` and a ``UserDatabaseDatasource`` to
/// both authenticate the user and create their account data in the database.
abstract class RepositoryBase {
  RepositoryBase(this.ref);

  /// A reference to a Riverpod [Reader] which can be user for reading
  /// dependencies like datasources or other Repositories.
  final ProviderRef ref;
}
