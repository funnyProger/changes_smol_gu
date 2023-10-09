import 'package:changes_smol_gu/data/entities/petition.dart';
import 'package:changes_smol_gu/gui/widgets/page_routes/to_info_page.dart';
import 'package:flutter/material.dart';
import 'parallax_animation/parallax_flow_delegate.dart';


class Item extends StatelessWidget {
  Item({super.key, required this.petition});
  final GlobalKey _backgroundImageKey = GlobalKey();
  final Petition petition;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.of(context).push(ToInfoPage().createAndGetRoute());
        },
        child: AspectRatio(
          aspectRatio: 16 / 16,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                _buildParallaxBackground(context),
                _buildGradient(),
                _buildTitleAndSubtitle(),
              ],
            ),
          ),
        ),
      )
    );
  }


  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context),
        listItemContext: context,
        backgroundImageKey: _backgroundImageKey,
      ),
      children: [
        Image.network(
          petition.image,
          height: 700,
          width: 383,
          key: _backgroundImageKey,
          fit: BoxFit.cover,
        ),
      ],
    );
  }


  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95],
          ),
        ),
      ),
    );
  }


  Widget _buildTitleAndSubtitle() {
    return Positioned(
      left: 20,
      right: 20,
      bottom: 20,
      child: SizedBox(
        width: 350,
        child: Text(
          petition.title,
          style: const  TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          softWrap: true,
        ),
      )
    );
  }
}