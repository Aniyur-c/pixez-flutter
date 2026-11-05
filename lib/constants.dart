/*
 * Copyright (C) 2020. by perol_notsf, All rights reserved
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program. If not, see <http://www.gnu.org/licenses/>.
 *
 */

import 'dart:io';

class Constants {
  static const String no_h = 'assets/images/h_long.jpg';
  /// 本仓库（下游分支）
  static const String repoName = "Aniyur-c/pixez-flutter";
  static const String repoUrl = "https://github.com/Aniyur-c/pixez-flutter";
  static const String releasesUrl =
      "https://github.com/Aniyur-c/pixez-flutter/releases";
  static const String releasesApi =
      "https://api.github.com/repos/Aniyur-c/pixez-flutter/releases/latest";

  /// 上游项目
  static const String upstreamName = "Notsfsssf/pixez-flutter";
  static const String upstreamUrl = "https://github.com/Notsfsssf/pixez-flutter";
  static const String upstreamTag = "0.9.113";

  /// 与 Release tag 对应，用于比较版本；versionLabel 仅用于界面展示
  static String tagName = "0.9.113-aniyur.1";
  static String versionLabel = "0.9.113 aniyur.1";
  static const isGooglePlay = bool.fromEnvironment(
    "IS_GOOGLEPLAY",
    defaultValue: false,
  );
  static int type = 0;
  static String? code_verifier = null;

  /// 为true表示使用FluentUI 否则为false,不应作为Desktop的判断
  static final bool isFluent = Platform.isWindows || Platform.isLinux;
}
