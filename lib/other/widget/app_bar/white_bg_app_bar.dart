import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rent_moto/constants/constants.dart';
import 'package:rent_moto/other/util/is.dart';
import 'package:rent_moto/other/widget/label.dart';

class WhiteBgAppBar extends StatelessWidget {
  const WhiteBgAppBar(
      {super.key,
      this.child,
      this.actions,
      this.appBarShow = true,
      this.titlePreviousShow = true,
      this.titlePrevious,
      this.previousShow = true,
      this.title,
      this.onPressBack,
      this.bottomNavigationBar,
      this.bottomSheet,
      this.previousColorText,
      this.buttonColor});

  final Widget? child;
  final List<Widget>? actions;
  final bool? appBarShow;
  final bool? titlePreviousShow;
  final bool? previousShow;
  final String? titlePrevious;
  final String? title;
  final Function? onPressBack;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Color? previousColorText;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: COLOR_GREY_LIGHT.withOpacity(0.3),
        child: SafeArea(
          child: Column(
            children: [
              appBarShow!
                  ? AppBar(
                      elevation: 0,
                      shadowColor: COLOR_WHITE.withOpacity(0),
                      backgroundColor: COLOR_TRANSPARENT,
                      leadingWidth: previousShow!
                          ? Is.notNullOrBlank(titlePrevious)
                              ? titlePrevious!.length < 6
                                  ? MediaQuery.of(context).size.width /
                                          (10 - titlePrevious!.length) +
                                      15
                                  : MediaQuery.of(context).size.width / 4
                              : MediaQuery.of(context).size.width / 5.5
                          : 0,
                      leading: previousShow!
                          ? GestureDetector(
                              onTap: () {
                                Is.notNull(onPressBack)
                                    ? onPressBack!.call()
                                    : Navigator.pop(context);
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 1),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.arrow_back_ios,
                                      size: DIMEN_HECTO,
                                      color: COLOR_BLUE_DARK,
                                    ),
                                    titlePreviousShow!
                                        ? Expanded(
                                            child: Label(
                                              Is.notNullOrBlank(titlePrevious)
                                                  ? titlePrevious!
                                                  : "Back",
                                              color: previousColorText,
                                              fontSize: Is.notNullOrBlank(
                                                      titlePrevious)
                                                  ? titlePrevious!.length <= 6
                                                      ? FONT_HECTO
                                                      : FONT_BASE
                                                  : FONT_HECTO,
                                              maxLines: 1,
                                            ),
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox(),
                      centerTitle: true,
                      title: Label(
                        Is.notNullOrBlank(title) ? title! : "",
                        color: COLOR_BLACK,
                        fontSize: FONT_KILO,
                        maxLines: 1,
                      ),
                      actions: actions != null ? actions!.toList() : [],
                    )
                  : const SizedBox(),
              Expanded(child: child!)
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
    );
  }
}
