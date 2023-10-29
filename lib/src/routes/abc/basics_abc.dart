import 'package:flutter/material.dart';
import 'package:flutter3_basics/flutter3_basics.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/10/23
///

/// 基础信息

class BasicsAbc extends StatelessWidget {
  const BasicsAbc({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final EdgeInsets padding = MediaQuery.paddingOf(context);

    const textStyle = TextStyle(color: Colors.red);
    dynamic textWidget = textSpanBuilder((builder) {
      builder
        ..addText("themeData:", style: textStyle)
        ..addText("${themeData.platform}")
        ..addText("\n" * 2)
        ..addText("mediaQueryData:", style: textStyle)
        ..addText("$mediaQueryData")
        ..addText("\n" * 2)
        ..addText("viewInsets:", style: textStyle)
        ..addText("${mediaQueryData.viewInsets}")
        ..addText("\n")
        ..addText("viewPadding:", style: textStyle)
        ..addText("${mediaQueryData.viewPadding}")
        ..addText("\n")
        ..addText("padding1:", style: textStyle)
        ..addText("${mediaQueryData.padding}")
        ..addText("\n")
        ..addText("padding2:", style: textStyle)
        ..addText("$padding");
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basics Abc'),
      ),
      body: Container(padding: const EdgeInsets.all(10), child: textWidget),
    );
  }
}
