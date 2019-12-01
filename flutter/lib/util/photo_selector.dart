import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kids_quiz/model/model.dart';
import 'package:kids_quiz/util/util.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'app_navigator.dart';

class PhotoSelector {
  const PhotoSelector({
    @required this.context,
    this.title,
  });

  final BuildContext context;
  final String title;

  Future<File> select() async {
    final source =
        await Provider.of<AppNavigator>(context).showConfirmSheet<ImageSource>(
      title: '画像の選択',
      actions: [
        SheetAction(
          icon: Icons.perm_media,
          label: 'ライブラリから選択',
          key: ImageSource.gallery,
        ),
        SheetAction(
          icon: Icons.camera_alt,
          label: '写真を撮る',
          key: ImageSource.camera,
        )
      ],
    );

    if (source == null) {
      return null;
    }

    try {
      return await ImagePicker.pickImage(
        source: source,
        maxWidth: 700,
        maxHeight: 700,
        imageQuality: 70,
      );
    } on PlatformException catch (e) {
      logger.warning(e);
      if (![
        ImagePickerErrorCodes.cameraAccessRestricted,
        ImagePickerErrorCodes.cameraAccessDenied,
      ].contains(e.code)) {
        Provider.of<AppNavigator>(context).showErrorDialog(e);
        return null;
      }

      const okKey = 'ok';
      final result =
          await Provider.of<AppNavigator>(context).showConfirmDialog<String>(
        title: '設定画面での許可が必要です',
        message: '設定アプリで写真アクセスの許可をお願いします。',
        actions: [
          DialogAction(
            label: MaterialLocalizations.of(context).cancelButtonLabel,
          ),
          const DialogAction(
            label: '設定アプリで許可',
            key: okKey,
          ),
        ],
      );
      if (result == okKey) {
        final opened = await PermissionHandler().openAppSettings();
        logger.assertOrShout(opened, 'could not open setting app');
      }
    }
    return null;
  }
}