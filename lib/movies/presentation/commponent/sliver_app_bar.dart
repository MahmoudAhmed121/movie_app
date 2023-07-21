import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.movieDetails});
  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(movieDetails.homePage);
    final httpsUrl = url.replace(scheme: 'https'); // تحويل الاتصال إلى https

    return SliverAppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(
            padding: const EdgeInsets.only(bottom: 15, top: 15),
            width: double.maxFinite,
            decoration: const BoxDecoration(
                color: Color(0xff16122B),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Center(
              child: Text(movieDetails.title,
                  style: GoogleFonts.poppins(
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.1,
                  )),
            ),
          )),
      pinned: true,
      backgroundColor: const Color(0xff16122B),
      expandedHeight: 350.0,
      flexibleSpace: FlexibleSpaceBar(
        background: FadeInUp(
          duration: const Duration(milliseconds: 500),
          child: ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  // fromLTRB
                  Colors.transparent,
                  Colors.black,
                  Colors.black,
                  Colors.transparent,
                ],
                stops: [0, 0.3, 0.5, 1],
              ).createShader(
                Rect.fromLTRB(0, 0, rect.width, rect.height),
              );
            },
            blendMode: BlendMode.dstIn,
            child: GestureDetector(
              onTap: () async {
                if (await canLaunchUrl(httpsUrl)) {
                  await launchUrl(httpsUrl);
                }
              },
              child: CachedNetworkImage(
                height: 560.0,
                imageUrl: ApiConstant.imageUrl(movieDetails.backdropPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
