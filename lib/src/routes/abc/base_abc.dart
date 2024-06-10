part of '../main_route.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/02
///

/// 有状态的Abc混入
mixin BaseAbcStateMixin<T extends StatefulWidget> on State<T> {
  /// 构建标题栏
  String? title;

  /// 是否使用滚动小部件[RScrollView]
  bool useScroll = true;

  /// [RScrollView.enableFrameLoad]
  bool enableFrameLoad = false;

  /// [RScrollView.frameSplitDuration]
  Duration frameSplitDuration = const Duration(milliseconds: 16);

  //---Scaffold

  /// 底部有插入时, 是否调整大小
  bool resizeToAvoidBottomInset = false;

  /// 背景颜色
  Color? backgroundColor;

  //---

  int currentIndex = 1;

  onPressed() {
    toastInfo("onPressed:${nowTimeString()}");
  }

  onClosing<T>([T? result]) {
    context.maybePop(result);
  }

  onSelectedIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  dynamic currentValue;

  onValueChanged(dynamic value) {
    setState(() {
      currentValue = value;
    });
  }

  //---

  /// 构建标题栏
  @protected
  PreferredSizeWidget buildAppBar(BuildContext context) {
    var themeData = Theme.of(context);
    return AppBar(
      title: Text(title ?? '${widget.runtimeType}'),
      flexibleSpace: linearGradientWidget(
        listOf(themeData.primaryColor, themeData.primaryColorDark),
      ),
    );
  }

  /// 构建内容
  /// ```
  /// return const Placeholder();
  /// ```
  /// [buildAbc]->[buildBody]
  @protected
  Widget buildBody(BuildContext context) {
    return const Placeholder();
  }

  /// 构建一个列表内容
  /// [buildAbc]->[buildBodyList]
  @protected
  WidgetList buildBodyList(BuildContext context) {
    return [];
  }

  /// 构建abc入口
  /// [build]->[buildAbc]
  @protected
  Widget buildAbc(BuildContext context) {
    List<Widget> bodyList = buildBodyList(context);
    Widget body = buildBody(context);

    if (useScroll) {
      //使用滚动小部件
      body = RScrollView(
        enableFrameLoad: enableFrameLoad,
        frameSplitDuration: frameSplitDuration,
        children: [...bodyList, if (bodyList.isEmpty) body],
      );
    } else {
      //不使用滚动组件
      if (bodyList.isNotEmpty) {
        //有多个child, 则使用Column包裹起来
        body = Column(
          children: bodyList,
        );
      }
    }
    return body;
  }

  /// override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Builder(builder: (context) => buildAbc(context)),
      backgroundColor: backgroundColor,
    );
  }
}

mixin AbcWidgetMixin {
  ScrollPhysics scrollPhysics = const AlwaysScrollableScrollPhysics(
      /*parent: BouncingScrollPhysics(),*/
      );

  ScrollController listViewController = ScrollController();
  ScrollController customScrollController = ScrollController();

  /// [CustomScrollView]
  Widget buildCustomScrollView() {
    return CustomScrollView(
      physics: scrollPhysics,
      controller: customScrollController,
      slivers: buildSliverScrollBodyList(),
    );
  }

  /// sliver
  List<Widget> buildSliverScrollBodyList() =>
      buildScrollBodyList().map((e) => e.toSliver()).toList();

  /// [ListView]
  Widget buildListView() {
    return ListView(
      physics: scrollPhysics,
      controller: listViewController,
      children: buildScrollBodyList(),
    );
  }

  /// widget
  List<Widget> buildScrollBodyList() {
    final result = <Widget>[];
    for (var i = 0; i < 20; i++) {
      const height = 30;
      result.add(SizedBox(
        height: height * (i / 2 + 1.0),
        child: Center(
          child: Text('Item $i'),
        ).container(
            color: Color.fromARGB(
                255, height * i, height * i * 2, height * i * 3)),
      ));
    }
    return result;
  }

  /// 构建一个Box
  Widget buildBox({double? height, String? text, Color? color}) {
    return SizedBox(
      height: height,
      child: Center(
        child: Text(text ?? 'Item'),
      ).container(color: color ?? Colors.redAccent),
    );
  }
}
