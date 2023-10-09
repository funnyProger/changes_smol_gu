import 'package:changes_smol_gu/gui/widgets/main_screen_widgets/catalog_page_widgets/catalog_item/parallax_animation/render_parallax_widget.dart';
import 'package:flutter/material.dart';

class Parallax extends SingleChildRenderObjectWidget {
  const Parallax({
    super.key,
    required Widget background,
  }) : super(child: background);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderParallax(scrollable: Scrollable.of(context));
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderParallax renderObject) {
    renderObject.scrollable = Scrollable.of(context);
  }
}