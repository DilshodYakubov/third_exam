import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({super.key});

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  bool isPlaying = false;

  double progress = 0;

  final double duration = 300; // 5 минут

  Timer? timer;

  void play() {
    isPlaying = true;

    timer?.cancel();

    timer = Timer.periodic(const Duration(microseconds: 100), (_) {
      if (!isPlaying) return;

      setState(() {
        progress += 0.1 / duration;

        if (progress >= 1) {
          progress = 1;
          isPlaying = false;
          timer?.cancel();
        }
      });
    });
  }

  void pause() {
    setState(() {
      isPlaying = false;
    });
  }

  void forward5Sec() {
    setState(() {
      progress += 10 / duration;

      if (progress > 1) {
        progress = 1;
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff23251E),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(
            value: progress,
            minHeight: 2,
            backgroundColor: Colors.grey.shade800,
            valueColor: const AlwaysStoppedAnimation(Color(0xffD5F0BA)),
          ),
          SizedBox(
            height: 70,
            child: Row(
              children: [
                const SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      height: 54,
                      width: 38,
                      decoration: BoxDecoration(color: AppColors.accentGreen),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isPlaying == true)
                      Row(
                        children: [
                          Image.asset('assets/images/volumn.png'),
                          SizedBox(width: 8),
                          Text(
                            "Now Playing",
                            style: GoogleFonts.poppins(
                              color: AppColors.accentGreen,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    else
                      Text(
                        "Continue Listening",
                        style: GoogleFonts.poppins(
                          color: AppColors.accentGreen,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    SizedBox(height: 4),
                    Text(
                      "Managers who want to create\npositive work enviroments...",
                      style: TextStyle(color: AppColors.grey1, fontSize: 12),
                    ),
                  ],
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (isPlaying) {
                        pause();
                      } else {
                        play();
                      }
                    });
                  },
                  borderRadius: .circular(100),

                  child: Container(
                    height: 37,
                    width: 37,
                    decoration: BoxDecoration(
                      color: AppColors.accentGreen,
                      borderRadius: .circular(100),
                    ),
                    child: isPlaying
                        ? Image.asset(
                            'assets/images/pause.png',
                            color: AppColors.grey4,
                          )
                        : Image.asset(
                            'assets/images/play.png',
                            color: AppColors.grey4,
                          ),
                  ),
                ),
                SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    forward5Sec();
                  },
                  borderRadius: .circular(100),
                  child: Container(
                    height: 37,
                    width: 37,
                    decoration: BoxDecoration(
                      borderRadius: .circular(100),
                      color: AppColors.accentGreen,
                    ),
                    child: Image.asset('assets/images/forward.png'),
                  ),
                ),

                const SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
