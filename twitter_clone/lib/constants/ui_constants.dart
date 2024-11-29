import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/theme/palette.dart';
import 'package:twitter_clone/constants/asset_constants.dart';

class UiConstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.twitterLogo,
        colorFilter: const ColorFilter.mode(
          Palette.blueColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
