import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:extended_image/extended_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.gallery,
        ),
      ),
      body: GridView.count(
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 2.0,
        crossAxisCount: 2,
        children: List.generate(9, (index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Zoom(
                      "https://picsum.photos/500?image=${index + 10}",
                      index + 10,
                    ),
                  ),
                );
              },
              child: Hero(
                tag: index + 10,
                child: CachedNetworkImage(
                  placeholder: (_, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  imageUrl: "https://picsum.photos/250?image=${index + 10}",
                ),
              ));
        }),
      ),
    );
  }
}

class Zoom extends StatelessWidget {
  Zoom(this.url, this.index);

  final String url;

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Hero(
        tag: this.index,
        child: ExtendedImage.network(
          this.url,
          cache: true,
          loadStateChanged: (ExtendedImageState state) {
            if (state.extendedImageLoadState == LoadState.loading) {
              return Center(child: CircularProgressIndicator());
            }
          },
          //enableLoadState: false,
          initGestureConfigHandler: (state) {
            return GestureConfig(
              minScale: 0.9,
              animationMinScale: 0.7,
              maxScale: 3.0,
              animationMaxScale: 3.5,
              speed: 1.0,
              inertialSpeed: 100.0,
              initialScale: 1.0,
              inPageView: false,
              initialAlignment: InitialAlignment.center,
            );
          },
          mode: ExtendedImageMode.gesture,
        ),
        // CachedNetworkImage(
        //   placeholder: (_, url) => Center(
        //     child: CircularProgressIndicator(),
        //   ),
        //   imageUrl: this.url,
        // ),
      ),
    );
  }
}
