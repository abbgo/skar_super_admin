import 'package:flutter/material.dart';
import 'package:skar_super_admin/helpers/functions/screen.dart';
import 'package:skar_super_admin/helpers/methods/image.dart';

class ShowImages extends StatefulWidget {
  const ShowImages({super.key, required this.images});

  final List<dynamic> images;

  @override
  State<ShowImages> createState() => _ShowImagesState();
}

class _ShowImagesState extends State<ShowImages> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenProperties(context).height * .8,
      width: screenProperties(context).height * .6,
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              children: widget.images
                  .map(
                    (e) => InteractiveViewer(
                      minScale: 0.01,
                      maxScale: 4,
                      child: showCachImageMethod(e),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 20),
          widget.images.length > 1
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: const Icon(Icons.arrow_back),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: const Icon(Icons.arrow_forward),
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
