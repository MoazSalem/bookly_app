import 'package:blur/blur.dart';
import 'package:bookly/features/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FeaturedListViewItem extends StatelessWidget {
  final String imageUrl;
  final int index;
  final bool playButton;
  const FeaturedListViewItem({
    super.key,
    required this.imageUrl,
    required this.index,
    this.playButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/book_details'),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          AspectRatio(
            aspectRatio: 0.65,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: imageUrl,
                placeholder: (context, url) => Center(
                    child: SizedBox(
                        height: playButton ? 100 : 50,
                        width: playButton ? 100 : 50,
                        child: const CircularProgressIndicator())),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          playButton
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: index == 0 ? 8 : 18),
                  child: const CircleAvatar(
                    backgroundColor: Colors.white12,
                    radius: 23,
                    child: Icon(Icons.play_arrow, color: Colors.white, size: 16),
                  ).frosted(
                      blur: 3.0,
                      frostColor: kPrimaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(kBorderRadius)),
                )
              : Container(),
        ],
      ),
    );
  }
}
