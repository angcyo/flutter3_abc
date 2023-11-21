part of laser_pecker;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/20
///

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  double coverHeight = kX * 2;
  double barPadding = kX;

  void _drawMineBackground(Canvas canvas, Rect childRect, Rect parentRect) {
    var globalTheme = GlobalTheme.of(context);
    var colors = [globalTheme.primaryColor, globalTheme.primaryColorDark];
    Rect backgroundRect = Rect.fromLTRB(
      parentRect.left,
      parentRect.top,
      parentRect.right,
      childRect.top,
    );
    canvas.drawRect(
      backgroundRect,
      Paint()
        ..shader = linearGradientShader(
          colors,
          rect: parentRect,
        ),
    );
    Rect bottomRect = Rect.fromLTRB(
      parentRect.left,
      childRect.top - coverHeight,
      parentRect.right,
      childRect.top,
    );
    canvas.drawRRect(
      bottomRect.toRRectTB(topRadius: kDefaultBorderRadiusXXX),
      Paint()..color = Colors.white,
    );
  }

  Widget _mineAppBar(BuildContext context) {
    var showCommunityControl = true;
    var globalTheme = GlobalTheme.of(context);
    double avatarSize = 48;
    return [
      //row1
      [
        lpSvgWidget(
          Assets.svg.defaultDeviceAvatar,
          fit: BoxFit.cover,
        )
            .circleShadow(
              clipContent: false,
              padding: EdgeInsets.all(globalTheme.m),
              width: avatarSize,
              height: avatarSize,
            )
            .paddingSymmetric(horizontal: globalTheme.xh),
        "LP-001".text(),
      ].row().paddingSymmetric(vertical: globalTheme.x).safeArea(),
      //row2
      if (showCommunityControl)
        [
          ["32".text(), LPS.of(context).attention.text()].column().expanded(),
          ["102".text(), LPS.of(context).fans.text()].column().expanded(),
          ["9".text(), LPS.of(context).like.text()].column().expanded(),
        ].row().paddingOnly(
              left: barPadding,
              top: barPadding,
              right: barPadding,
              bottom: barPadding + coverHeight,
            ),
    ].column();
  }

  @override
  Widget build(BuildContext context) {
    var globalTheme = GlobalTheme.of(context);
    return Scaffold(
      body: [
        _mineAppBar(context),
        SliverPaintWidget(
          painter: _drawMineBackground,
        ),
        lpSvgWidget(Assets.svg.mineArticle)
            .columnOf(LPS.of(context).article.text())
            .inkRadius(
              onTap: () {},
            )
            .rGridTile(3, childAspectRatio: 1 / 0.6),
        lpSvgWidget(Assets.svg.mineFiles)
            .columnOf(LPS.of(context).files.text())
            .inkRadius(
              onTap: () {},
            )
            .rGridTile(3),
        lpSvgWidget(Assets.svg.mineHistory)
            .columnOf(LPS.of(context).history.text())
            .inkRadius(
              onTap: () {},
            )
            .rGridTile(3),
        lpSvgWidget(Assets.svg.mineHelp)
            .columnOf(LPS.of(context).help.text())
            .inkRadius(
              onTap: () {},
            )
            .rGridTile(3),
        lpSvgWidget(Assets.svg.mineSetting)
            .columnOf(LPS.of(context).setting.text())
            .inkRadius(
              onTap: () {},
            )
            .rGridTile(3),
        lpSvgWidget(Assets.svg.mineFaq)
            .columnOf(LPS.of(context).faq.text())
            .inkRadius(
              onTap: () {},
            )
            .rGridTile(3),
        [
          LPS
              .of(context)
              .nearConnectedDeviceLabel
              .text(
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
              .expanded(),
          [LPS.of(context).more.text(), lpSvgWidget(Assets.svg.next)]
              .row()
              .inkWell(onTap: () {}),
        ].row().paddingAll(globalTheme.xh),
        "App版本:xxx"
            .text()
            .container(
              padding: const EdgeInsets.all(kBottomNavigationBarCoverHeight),
              alignment: Alignment.bottomCenter,
            )
            .rFill(),
      ].rScroll(),
    );
  }
}
