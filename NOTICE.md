# 下游分支说明 / NOTICE

本仓库是 [Notsfsssf/pixez-flutter](https://github.com/Notsfsssf/pixez-flutter) 的下游分支，遵循 GPL-3.0。

与原作者（Perol / Notsfsssf）无隶属关系，也未获其背书；本分支的问题请提到本仓库，不要打扰上游。

按 GPLv3 §5(a) 的要求，下面列出相对上游 `29f1894e`（tag `0.9.113`）的改动内容和日期。

## 改动清单（2026-11-05）

新增：

- `lib/component/floating_glass_nav_bar.dart` — 悬浮磨砂底栏组件（背景模糊、可拖动选中指示器、弹簧落位动画）
- `test/floating_glass_nav_bar_test.dart` — 该组件的点击 / 拖动 / 渲染测试

修改：

- `lib/page/hello/android_hello_page.dart` — Android 壳接入悬浮底栏；FAB 偏移与全屏隐藏高度改用 `FloatingGlassNavBar.occupiedHeight`
- `lib/page/novel/novel_rail.dart` — 小说模式接入同一底栏，`extendBody: true`
- `lib/constants.dart` — 新增本仓库 / 上游信息常量；`tagName`、`versionLabel` 改为 `0.9.2`
- `lib/er/updater.dart` — 更新检查地址指向本仓库的 releases
- `lib/page/about/about_page.dart` — 新增「本分支」说明卡片与上游入口
- `lib/page/about/update_page.dart`、`lib/fluent/page/about/update_page.dart` — 更新检查地址同步
- `lib/fluent/page/about/about_page.dart` — 版本号与仓库链接同步
- `android/app/build.gradle.kts` — `applicationId` 改为 `com.aniyur.pixez`；`versionName` 改为 `0.9.2`；补 `compileSdkMinor`
- `android/androidndkgif/build.gradle.kts` — 补 `compileSdkMinor`（适配新版 Android SDK 包名）
- `pubspec.yaml` — `identity_name` 改为 `com.aniyur.pixez`
- `README.md` — 增加本分支说明入口

删除（上游遗留的临时文件，与功能无关）：

- `comment_element.html`
- `comment_emoji2map.py`
- `to_lower.dart`
- `New-MsixCert.ps1`

## 分发说明

- APK 使用本分支自己的签名（`SHA-256 b597052c2bfa4bb972468e4ad167603971db98c9bc558e4b681d9b44e079084f`），包名 `com.aniyur.pixez`，可与官方版本共存安装
- 二进制与源码同源：发布的 APK 对应本仓库的 `0.9.2` tag
- 未做任何闭源改动，也未移除原作者版权声明与 `LICENSE`

## 许可

本项目沿用 GPL-3.0。原始版权归 Perol / Notsfsssf 及各贡献者所有；本分支的修改同样以 GPL-3.0 授权。
