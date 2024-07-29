import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

final _uuidProvider = Provider((ref) => const Uuid());

final uidProvider = Provider.autoDispose((ref) => ref.watch(_uuidProvider).v1());