import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:skar_super_admin/helpers/methods/image.dart';
import 'package:skar_super_admin/helpers/static_data.dart';

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
    print('----------- ${widget.images.length}');
    return PageView.builder(
      itemCount: widget.images.length,
      itemBuilder: (context, index) {
        return showCachImageMethod(widget.images[index]);
      },
    );
    // return PhotoViewGallery.builder(
    //   itemCount: widget.images.length,
    //   builder: (BuildContext context, int index) {
    //     return PhotoViewGalleryPageOptions(
    //       imageProvider: NetworkImage('$pathUrl/${widget.images[index]}'),
    //       initialScale: PhotoViewComputedScale.contained * 0.8,
    //       heroAttributes: PhotoViewHeroAttributes(tag: index),
    //     );
    //   },
    //   loadingBuilder: (context, event) => const CircularProgressIndicator(),
    //   pageController: _pageController,
    // );
  }
}
