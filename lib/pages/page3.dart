import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class Page3 extends StatefulWidget {
  const Page3({
    Key? key,
    required this.viewerSize,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  final double viewerSize;
  final double screenHeight;
  final double screenWidth;

  @override
  State<Page3> createState() =>
      _Page3State();
}

class _Page3State extends State<Page3> {
  late TransformationController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: InteractiveViewer.builder(
          boundaryMargin: const EdgeInsets.all(40.0),
          minScale: 0.001,
          maxScale: 50,
          transformationController: controller,
          builder: ( context, quad) {
            return Center(
              child: SizedBox(
                width: widget.viewerSize,
                height: widget.viewerSize,
                child: const InteractiveViewerContent(),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    controller = TransformationController(
      Matrix4.translation(
        Vector3(
          (-widget.viewerSize + widget.screenWidth) / 2,
          (-widget.viewerSize + widget.screenHeight) / 2,
          0,
        ),
      ),
    );
  }
}

class InteractiveViewerContent extends StatelessWidget {
  const InteractiveViewerContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? style = Theme.of(context).textTheme.headline6;

    return Container(
      padding: const EdgeInsets.all(32.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[Colors.orange, Colors.red, Colors.yellowAccent],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SelectableText("Top Left", style: style),
          ),
          SelectableText("Center", style: style),
        ],
      ),
    );
  }
}