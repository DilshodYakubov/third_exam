import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';
import 'package:third_exam/src/features/book_details/presentation/widgets/container_player.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.white,
                    size: 35,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert, color: AppColors.white),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/futurama.png'),
                  fit: .cover,
                ),
              ),
            ),
            SizedBox(height: 47),
            Padding(
              padding: .only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  ContainerPlayer(),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: .all(16),
                    decoration: BoxDecoration(
                      borderRadius: .circular(10),
                      color: AppColors.bgMain,
                    ),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text(
                              'Readings',
                              style: GoogleFonts.poppins(
                                color: AppColors.grey1,
                                fontSize: 16,
                              ),
                            ),
                            Image.asset('assets/images/cover.png'),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Far far away, behind the wordmountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.",
                          style: GoogleFonts.poppins(
                            color: AppColors.white,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: .end,
                          children: [
                            InkWell(
                              onTap: () {},
                              borderRadius: .circular(100),
                              child: Container(
                                height: 28,
                                width: 86,
                                decoration: BoxDecoration(
                                  borderRadius: .circular(5),
                                  color: AppColors.accentGreen,
                                ),
                                child: Row(
                                  mainAxisAlignment: .center,
                                  children: [
                                    Image.asset('assets/images/share.png'),
                                    SizedBox(width: 5),
                                    Text(
                                      'Share',
                                      style: GoogleFonts.poppins(
                                        color: AppColors.grey4,
                                        fontWeight: .bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
