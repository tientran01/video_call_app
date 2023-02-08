/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_add.png
  AssetGenImage get icAdd => const AssetGenImage('assets/icons/ic_add.png');

  /// File path: assets/icons/ic_calendar.png
  AssetGenImage get icCalendar =>
      const AssetGenImage('assets/icons/ic_calendar.png');

  /// File path: assets/icons/ic_call.png
  AssetGenImage get icCall => const AssetGenImage('assets/icons/ic_call.png');

  /// File path: assets/icons/ic_change_camera.png
  AssetGenImage get icChangeCamera =>
      const AssetGenImage('assets/icons/ic_change_camera.png');

  /// File path: assets/icons/ic_chat.png
  AssetGenImage get icChat => const AssetGenImage('assets/icons/ic_chat.png');

  /// File path: assets/icons/ic_contact.png
  AssetGenImage get icContact =>
      const AssetGenImage('assets/icons/ic_contact.png');

  /// File path: assets/icons/ic_create.png
  AssetGenImage get icCreate =>
      const AssetGenImage('assets/icons/ic_create.png');

  /// File path: assets/icons/ic_edit.png
  AssetGenImage get icEdit => const AssetGenImage('assets/icons/ic_edit.png');

  /// File path: assets/icons/ic_info.png
  AssetGenImage get icInfo => const AssetGenImage('assets/icons/ic_info.png');

  /// File path: assets/icons/ic_link.png
  AssetGenImage get icLink => const AssetGenImage('assets/icons/ic_link.png');

  /// File path: assets/icons/ic_meeting.png
  AssetGenImage get icMeeting =>
      const AssetGenImage('assets/icons/ic_meeting.png');

  /// File path: assets/icons/ic_mic.png
  AssetGenImage get icMic => const AssetGenImage('assets/icons/ic_mic.png');

  /// File path: assets/icons/ic_mic_off.png
  AssetGenImage get icMicOff =>
      const AssetGenImage('assets/icons/ic_mic_off.png');

  /// File path: assets/icons/ic_more.png
  AssetGenImage get icMore => const AssetGenImage('assets/icons/ic_more.png');

  /// File path: assets/icons/ic_send.png
  AssetGenImage get icSend => const AssetGenImage('assets/icons/ic_send.png');

  /// File path: assets/icons/ic_share_screen.png
  AssetGenImage get icShareScreen =>
      const AssetGenImage('assets/icons/ic_share_screen.png');

  /// File path: assets/icons/ic_team_chat.png
  AssetGenImage get icTeamChat =>
      const AssetGenImage('assets/icons/ic_team_chat.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        icAdd,
        icCalendar,
        icCall,
        icChangeCamera,
        icChat,
        icContact,
        icCreate,
        icEdit,
        icInfo,
        icLink,
        icMeeting,
        icMic,
        icMicOff,
        icMore,
        icSend,
        icShareScreen,
        icTeamChat
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
