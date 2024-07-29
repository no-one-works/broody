import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:broody/model/entry/entry.dart';
import 'package:broody/model/project/project.dart';
import 'package:broody/service/repositories/entry.repository.dart';
import 'package:broody/service/repositories/video_gallery.repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';

Future<bool> showClipTooShortDialog(BuildContext context, WidgetRef ref,
    {required AssetEntity entity}) async {
  final l10n = L10n.of(context)!;

  final res = await showOkCancelAlertDialog(
    context: context,
    title: l10n.tooShortDialogTitle,
    message: l10n.tooShortDialogContent,
    okLabel: l10n.delete,
    cancelLabel: l10n.no,
    defaultType: OkCancelAlertDefaultType.ok,
    isDestructiveAction: true,
    useRootNavigator: true,
  );
  if (res == OkCancelResult.ok) {
    await ref.read(videoGalleryRepositoryProvider).deleteVideo(entity);
    return true;
  }
  return false;
}

Future<bool> showDeleteEntryDialog(BuildContext context, WidgetRef ref,
    {required SavedEntry entry}) async {
  final l10n = L10n.of(context)!;

  final res = await showOkCancelAlertDialog(
    context: context,
    title: l10n.deleteEntryDialogTitle,
    message: l10n.deleteEntryDialogContent,
    okLabel: l10n.delete,
    cancelLabel: l10n.no,
    defaultType: OkCancelAlertDefaultType.ok,
    isDestructiveAction: true,
    useActionSheetForCupertino: true,
    useRootNavigator: true,
  );
  if (res == OkCancelResult.ok) {
    await ref.read(entryRepositoryProvider).deleteEntry(entry);
    return true;
  }
  return false;
}

Future<bool> showDestructiveProjectEditDialog(
    BuildContext context, WidgetRef ref) async {
  final l10n = L10n.of(context)!;

  final res = await showOkCancelAlertDialog(
    context: context,
    title: l10n.destructiveProjectEditDialogTitle,
    message: l10n.destructiveProjectEditDialogContent,
    okLabel: l10n.continueBtn,
    cancelLabel: l10n.cancel,
    defaultType: OkCancelAlertDefaultType.ok,
    isDestructiveAction: true,
    useActionSheetForCupertino: true,
    useRootNavigator: true,
  );
  if (res == OkCancelResult.ok) {
    return true;
  }
  return false;
}

Future<void> showEntryOriginalNotFoundDialog(
    BuildContext context, WidgetRef ref) async {
  final l10n = L10n.of(context)!;

  await showOkAlertDialog(
    context: context,
    title: l10n.entryWithoutOriginalDialogTitle,
    message: l10n.entryWithoutOriginalDialogContent,
    useRootNavigator: true,
  );
}

Future<bool> showEndProjectDialog(BuildContext context, WidgetRef ref,
    {required Project project}) async {
  final l10n = L10n.of(context)!;

  final res = await showOkCancelAlertDialog(
    context: context,
    title: l10n.endProjectDialogTitle,
    message: l10n.endProjectDialogContent,
    okLabel: l10n.end,
    cancelLabel: l10n.no,
    defaultType: OkCancelAlertDefaultType.ok,
    isDestructiveAction: true,
    useRootNavigator: true,
  );
  if (res == OkCancelResult.ok) {
    return true;
  }
  return false;
}

Future<bool> showDeleteProjectDialog(BuildContext context, WidgetRef ref,
    {required Project project}) async {
  final l10n = L10n.of(context)!;

  final res = await showOkCancelAlertDialog(
    context: context,
    title: l10n.deleteProjectDialogTitle,
    message: l10n.deleteProjectDialogContent(project.title),
    okLabel: l10n.delete,
    cancelLabel: l10n.no,
    defaultType: OkCancelAlertDefaultType.ok,
    isDestructiveAction: true,
    useActionSheetForCupertino: true,
    useRootNavigator: true,
  );
  if (res == OkCancelResult.ok) {
    return true;
  }
  return false;
}

Future<bool> showMissingGalleryPermissionDialog(
    BuildContext context, WidgetRef ref) async {
  final l10n = L10n.of(context)!;

  final res = await showOkCancelAlertDialog(
    context: context,
    title: l10n.missingPermissionDialogTitle,
    message: l10n.missingGalleryPermissionDialogContent,
    okLabel: l10n.missingPermissionDialogOk,
    cancelLabel: l10n.cancel,
    defaultType: OkCancelAlertDefaultType.ok,
    useRootNavigator: true,
  );
  if (res == OkCancelResult.ok) {
    PhotoManager.openSetting();
    return true;
  }
  return false;
}

Future<bool> showMissingNotificationPermissionDialog(
    BuildContext context, WidgetRef ref) async {
  final l10n = L10n.of(context)!;

  final res = await showOkCancelAlertDialog(
    context: context,
    title: l10n.missingPermissionDialogTitle,
    message: l10n.missingNotificationPermissionDialogContent,
    okLabel: l10n.missingPermissionDialogOk,
    cancelLabel: l10n.cancel,
    defaultType: OkCancelAlertDefaultType.ok,
    useRootNavigator: true,
  );
  if (res == OkCancelResult.ok) {
    PhotoManager.openSetting();
    return true;
  }
  return false;
}
