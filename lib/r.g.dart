// IT IS GENERATED BY FLR - DO NOT MODIFY BY HAND
// YOU CAN GET MORE DETAILS ABOUT FLR FROM:
// - https://github.com/Fly-Mix/flr-cli
// - https://github.com/Fly-Mix/flr-vscode-extension
// - https://github.com/Fly-Mix/flr-as-plugin
//

// ignore: unused_import
import 'package:flutter/widgets.dart';
// ignore: unused_import
import 'package:flutter/services.dart' show rootBundle;
// ignore: unused_import
import 'package:path/path.dart' as path;
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';
// ignore: unused_import
import 'package:r_dart_library/asset_svg.dart';

/// This `R` class is generated and contains references to static asset resources.
class R {
  /// package name: thj_first_flutter
  static const package = "thj_first_flutter";

  /// This `R.image` struct is generated, and contains static references to static non-svg type image asset resources.
  static const image = _R_Image();

  /// This `R.svg` struct is generated, and contains static references to static svg type image asset resources.
  static const svg = _R_Svg();

  /// This `R.text` struct is generated, and contains static references to static text asset resources.
  static const text = _R_Text();

  /// This `R.fontFamily` struct is generated, and contains static references to static font asset resources.
  static const fontFamily = _R_FontFamily();
}

/// Asset resource’s metadata class.
/// For example, here is the metadata of `packages/flutter_demo/assets/images/example.png` asset:
/// - packageName：flutter_demo
/// - assetName：assets/images/example.png
/// - fileDirname：assets/images
/// - fileBasename：example.png
/// - fileBasenameNoExtension：example
/// - fileExtname：.png
class AssetResource {
  /// Creates an object to hold the asset resource’s metadata.
  const AssetResource(this.assetName, {this.packageName})
      : assert(assetName != null);

  /// The name of the main asset from the set of asset resources to choose from.
  final String assetName;

  /// The name of the package from which the asset resource is included.
  final String packageName;

  /// The name used to generate the key to obtain the asset resource. For local assets
  /// this is [assetName], and for assets from packages the [assetName] is
  /// prefixed 'packages/<package_name>/'.
  String get keyName =>
      packageName == null ? assetName : "packages/$packageName/$assetName";

  /// The file basename of the asset resource.
  String get fileBasename {
    final basename = path.basename(assetName);
    return basename;
  }

  /// The no extension file basename of the asset resource.
  String get fileBasenameNoExtension {
    final basenameWithoutExtension = path.basenameWithoutExtension(assetName);
    return basenameWithoutExtension;
  }

  /// The file extension name of the asset resource.
  String get fileExtname {
    final extension = path.extension(assetName);
    return extension;
  }

  /// The directory path name of the asset resource.
  String get fileDirname {
    var dirname = assetName;
    if (packageName != null) {
      final packageStr = "packages/$packageName/";
      dirname = dirname.replaceAll(packageStr, "");
    }
    final filenameStr = "$fileBasename/";
    dirname = dirname.replaceAll(filenameStr, "");
    return dirname;
  }
}

// ignore: camel_case_types
class _R_Image_AssetResource {
  const _R_Image_AssetResource();

  /// asset: images/discover/discover_topnotice.png
  // ignore: non_constant_identifier_names
  final discover_topnotice = const AssetResource(
      "images/discover/discover_topnotice.png",
      packageName: null);

  /// asset: images/home/home_consult.png
  // ignore: non_constant_identifier_names
  final home_consult =
      const AssetResource("images/home/home_consult.png", packageName: null);

  /// asset: images/home/home_course.png
  // ignore: non_constant_identifier_names
  final home_course =
      const AssetResource("images/home/home_course.png", packageName: null);

  /// asset: images/home/home_exam.png
  // ignore: non_constant_identifier_names
  final home_exam =
      const AssetResource("images/home/home_exam.png", packageName: null);

  /// asset: images/home/home_micro.png
  // ignore: non_constant_identifier_names
  final home_micro =
      const AssetResource("images/home/home_micro.png", packageName: null);

  /// asset: images/home/home_question.png
  // ignore: non_constant_identifier_names
  final home_question =
      const AssetResource("images/home/home_question.png", packageName: null);

  /// asset: images/me/mine_facesign.png
  // ignore: non_constant_identifier_names
  final mine_facesign =
      const AssetResource("images/me/mine_facesign.png", packageName: null);

  /// asset: images/me/mine_nav_complaint.png
  // ignore: non_constant_identifier_names
  final mine_nav_complaint = const AssetResource(
      "images/me/mine_nav_complaint.png",
      packageName: null);

  /// asset: images/me/mine_nav_setting.png
  // ignore: non_constant_identifier_names
  final mine_nav_setting =
      const AssetResource("images/me/mine_nav_setting.png", packageName: null);

  /// asset: images/me/mine_sixlab.png
  // ignore: non_constant_identifier_names
  final mine_sixlab =
      const AssetResource("images/me/mine_sixlab.png", packageName: null);

  /// asset: images/me/mine_sixqy.png
  // ignore: non_constant_identifier_names
  final mine_sixqy =
      const AssetResource("images/me/mine_sixqy.png", packageName: null);

  /// asset: images/me/user_header_pl.png
  // ignore: non_constant_identifier_names
  final user_header_pl =
      const AssetResource("images/me/user_header_pl.png", packageName: null);

  /// asset: images/tabbar/course_teacher_round@2x.png
  // ignore: non_constant_identifier_names
  final course_teacher_round_2x = const AssetResource(
      "images/tabbar/course_teacher_round@2x.png",
      packageName: null);

  /// asset: images/tabbar/discover.png
  // ignore: non_constant_identifier_names
  final discover =
      const AssetResource("images/tabbar/discover.png", packageName: null);

  /// asset: images/tabbar/discover_select.png
  // ignore: non_constant_identifier_names
  final discover_select = const AssetResource(
      "images/tabbar/discover_select.png",
      packageName: null);

  /// asset: images/tabbar/home.png
  // ignore: non_constant_identifier_names
  final home = const AssetResource("images/tabbar/home.png", packageName: null);

  /// asset: images/tabbar/home_select.png
  // ignore: non_constant_identifier_names
  final home_select =
      const AssetResource("images/tabbar/home_select.png", packageName: null);

  /// asset: images/tabbar/me.png
  // ignore: non_constant_identifier_names
  final me = const AssetResource("images/tabbar/me.png", packageName: null);

  /// asset: images/tabbar/me_select.png
  // ignore: non_constant_identifier_names
  final me_select =
      const AssetResource("images/tabbar/me_select.png", packageName: null);

  /// asset: images/youluIcon.png
  // ignore: non_constant_identifier_names
  final youluIcon =
      const AssetResource("images/youluIcon.png", packageName: null);
}

// ignore: camel_case_types
class _R_Svg_AssetResource {
  const _R_Svg_AssetResource();
}

// ignore: camel_case_types
class _R_Text_AssetResource {
  const _R_Text_AssetResource();
}

/// This `_R_Image` class is generated and contains references to static non-svg type image asset resources.
// ignore: camel_case_types
class _R_Image {
  const _R_Image();

  final asset = const _R_Image_AssetResource();

  /// asset: images/discover/discover_topnotice.png
  // ignore: non_constant_identifier_names
  AssetImage discover_topnotice() {
    return AssetImage(asset.discover_topnotice.keyName);
  }

  /// asset: images/home/home_consult.png
  // ignore: non_constant_identifier_names
  AssetImage home_consult() {
    return AssetImage(asset.home_consult.keyName);
  }

  /// asset: images/home/home_course.png
  // ignore: non_constant_identifier_names
  AssetImage home_course() {
    return AssetImage(asset.home_course.keyName);
  }

  /// asset: images/home/home_exam.png
  // ignore: non_constant_identifier_names
  AssetImage home_exam() {
    return AssetImage(asset.home_exam.keyName);
  }

  /// asset: images/home/home_micro.png
  // ignore: non_constant_identifier_names
  AssetImage home_micro() {
    return AssetImage(asset.home_micro.keyName);
  }

  /// asset: images/home/home_question.png
  // ignore: non_constant_identifier_names
  AssetImage home_question() {
    return AssetImage(asset.home_question.keyName);
  }

  /// asset: images/me/mine_facesign.png
  // ignore: non_constant_identifier_names
  AssetImage mine_facesign() {
    return AssetImage(asset.mine_facesign.keyName);
  }

  /// asset: images/me/mine_nav_complaint.png
  // ignore: non_constant_identifier_names
  AssetImage mine_nav_complaint() {
    return AssetImage(asset.mine_nav_complaint.keyName);
  }

  /// asset: images/me/mine_nav_setting.png
  // ignore: non_constant_identifier_names
  AssetImage mine_nav_setting() {
    return AssetImage(asset.mine_nav_setting.keyName);
  }

  /// asset: images/me/mine_sixlab.png
  // ignore: non_constant_identifier_names
  AssetImage mine_sixlab() {
    return AssetImage(asset.mine_sixlab.keyName);
  }

  /// asset: images/me/mine_sixqy.png
  // ignore: non_constant_identifier_names
  AssetImage mine_sixqy() {
    return AssetImage(asset.mine_sixqy.keyName);
  }

  /// asset: images/me/user_header_pl.png
  // ignore: non_constant_identifier_names
  AssetImage user_header_pl() {
    return AssetImage(asset.user_header_pl.keyName);
  }

  /// asset: images/tabbar/course_teacher_round@2x.png
  // ignore: non_constant_identifier_names
  AssetImage course_teacher_round_2x() {
    return AssetImage(asset.course_teacher_round_2x.keyName);
  }

  /// asset: images/tabbar/discover.png
  // ignore: non_constant_identifier_names
  AssetImage discover() {
    return AssetImage(asset.discover.keyName);
  }

  /// asset: images/tabbar/discover_select.png
  // ignore: non_constant_identifier_names
  AssetImage discover_select() {
    return AssetImage(asset.discover_select.keyName);
  }

  /// asset: images/tabbar/home.png
  // ignore: non_constant_identifier_names
  AssetImage home() {
    return AssetImage(asset.home.keyName);
  }

  /// asset: images/tabbar/home_select.png
  // ignore: non_constant_identifier_names
  AssetImage home_select() {
    return AssetImage(asset.home_select.keyName);
  }

  /// asset: images/tabbar/me.png
  // ignore: non_constant_identifier_names
  AssetImage me() {
    return AssetImage(asset.me.keyName);
  }

  /// asset: images/tabbar/me_select.png
  // ignore: non_constant_identifier_names
  AssetImage me_select() {
    return AssetImage(asset.me_select.keyName);
  }

  /// asset: images/youluIcon.png
  // ignore: non_constant_identifier_names
  AssetImage youluIcon() {
    return AssetImage(asset.youluIcon.keyName);
  }
}

/// This `_R_Svg` class is generated and contains references to static svg type image asset resources.
// ignore: camel_case_types
class _R_Svg {
  const _R_Svg();

  final asset = const _R_Svg_AssetResource();
}

/// This `_R_Text` class is generated and contains references to static text asset resources.
// ignore: camel_case_types
class _R_Text {
  const _R_Text();

  final asset = const _R_Text_AssetResource();
}

/// This `_R_FontFamily` class is generated and contains references to static font asset resources.
// ignore: camel_case_types
class _R_FontFamily {
  const _R_FontFamily();
}