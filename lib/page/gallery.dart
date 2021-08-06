import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:transparent_image/transparent_image.dart';

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
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: "https://picsum.photos/250?image=${index + 10}",
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
        child: Image.network(this.url),
      ),
    );
  }
}
