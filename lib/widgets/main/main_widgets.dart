import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantImageWidget extends StatelessWidget {
  const RestaurantImageWidget({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: CachedNetworkImage(
          errorWidget: (context, url, error) => Center(child: Icon(Icons.image)),
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(),
          ),
          imageUrl: imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class RestaurantInfoWidget extends StatelessWidget {
  final String name;
  final String address;

  RestaurantInfoWidget({required this.name, required this.address});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              name,
              style: GoogleFonts.jetBrainsMono(
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              address,
              style: GoogleFonts.jetBrainsMono(
                fontWeight: FontWeight.w900,
              ),
            )
          ],
        ),
      ),
    );
  }
}
