import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:pixez/component/floating_glass_nav_bar.dart';

const _destinations = [
  GlassNavDestination(
    icon: Icons.home_outlined,
    activeIcon: Icons.home,
    label: '首页',
  ),
  GlassNavDestination(
    icon: Icons.leaderboard_outlined,
    activeIcon: Icons.leaderboard,
    label: '排行榜',
  ),
  GlassNavDestination(
    icon: Icons.favorite_border,
    activeIcon: Icons.favorite,
    label: '收藏',
  ),
  GlassNavDestination(
    icon: Icons.search_outlined,
    activeIcon: Icons.search,
    label: '搜索',
  ),
  GlassNavDestination(
    icon: Icons.more_horiz_outlined,
    activeIcon: Icons.more_horiz,
    label: '更多',
  ),
];

Widget _app({required int current, required ValueChanged<int> onSelected}) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5B7CFA)),
      useMaterial3: true,
    ),
    home: Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: ColoredBox(color: Color(0xFFFF9A8B))),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: FloatingGlassNavBar(
              currentIndex: current,
              destinations: _destinations,
              onDestinationSelected: onSelected,
            ),
          ),
        ],
      ),
    ),
  );
}

/// 底栏的交互回归测试：点击切换、拖动吸附、切换动画从当前位置连续出发。
void main() {
  testWidgets('glass nav bar taps and drags', (tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 300));
    var current = 0;
    late StateSetter setter;

    await tester.pumpWidget(
      StatefulBuilder(
        builder: (context, setState) {
          setter = setState;
          return _app(
            current: current,
            onSelected: (i) => setter(() => current = i),
          );
        },
      ),
    );
    await tester.pump();
    expect(current, 0);

    // 点击"收藏"切到第 3 个标签。
    await tester.tap(find.byIcon(Icons.favorite_border));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 700));
    expect(current, 2);

    // 从第 3 格往左拖到第 1 格，松手吸附。
    final rect = tester.getRect(find.byType(FloatingGlassNavBar));
    final cell = (rect.width - 20 * 2) / 5;
    final start = Offset(rect.left + 20 + cell * 2.5, rect.center.dy);
    await tester.dragFrom(start, const Offset(-150, 0));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 700));
    expect(current, 0);

    // 最后一格"更多"。
    await tester.tap(find.byIcon(Icons.more_horiz_outlined));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 700));
    expect(current, 4);
    expect(tester.takeException(), isNull);

    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('switch animation continues from the current position', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(400, 300));
    var current = 0;
    late StateSetter setter;

    await tester.pumpWidget(
      StatefulBuilder(
        builder: (context, setState) {
          setter = setState;
          return _app(
            current: current,
            onSelected: (i) => setter(() => current = i),
          );
        },
      ),
    );
    await tester.pump();

    final indicator = find.byKey(const ValueKey('glassNavIndicator'));
    expect(indicator, findsOneWidget);
    final start = tester.getRect(indicator);

    // 0 -> 2，动画走到一半再点"更多"，不能跳回最左端。
    await tester.tap(find.byIcon(Icons.favorite_border));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));
    final mid = tester.getRect(indicator);

    await tester.tap(find.byIcon(Icons.more_horiz_outlined));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 16));
    final after = tester.getRect(indicator);

    expect(mid.left, greaterThan(start.left));
    // 一格约 75px，一帧之内不可能跨过一整格。
    expect((after.left - mid.left).abs(), lessThan(75.0));

    await tester.pump(const Duration(milliseconds: 800));
    expect(current, 4);
    expect(tester.getRect(indicator).left, greaterThan(after.left));
    expect(tester.takeException(), isNull);

    await tester.binding.setSurfaceSize(null);
  });
}
