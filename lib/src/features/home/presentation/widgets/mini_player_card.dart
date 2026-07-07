import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

class MiniPlayerCard extends StatefulWidget {
  const MiniPlayerCard({
    super.key,
    required this.title,
    required this.author,
    this.duration = const Duration(minutes: 5, seconds: 10),
    this.initialPosition = const Duration(minutes: 1, seconds: 14),
    this.onTap,
  });

  final String title;
  final String author;
  final Duration duration;
  final Duration initialPosition;
  final VoidCallback? onTap;

  @override
  State<MiniPlayerCard> createState() => _MiniPlayerCardState();
}

class _MiniPlayerCardState extends State<MiniPlayerCard> {
  late Duration _position;
  bool _isPlaying = false;
  Timer? _ticker;

  @override
  void initState() {
    super.initState();
    _position = widget.initialPosition;
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  void _togglePlay() {
    setState(() => _isPlaying = !_isPlaying);
    if (_isPlaying) {
      _ticker?.cancel();
      _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
        setState(() {
          if (_position >= widget.duration) {
            _isPlaying = false;
            _ticker?.cancel();
          } else {
            _position += const Duration(seconds: 1);
          }
        });
      });
    } else {
      _ticker?.cancel();
    }
  }

  void _seekTo(double fractionOfTotal) {
    final totalMs = widget.duration.inMilliseconds;
    setState(() {
      _position = Duration(milliseconds: (totalMs * fractionOfTotal).round());
    });
  }

  String _fmt(Duration d) {
    final m = d.inMinutes.remainder(60);
    final s = d.inSeconds.remainder(60);
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final progress = widget.duration.inMilliseconds == 0
        ? 0.0
        : _position.inMilliseconds / widget.duration.inMilliseconds;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.valid, AppColors.grey3, AppColors.grey3],
              begin: .bottomLeft,
              end: .center,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 143,
                width: 99,
                color: AppColors.containerGradient,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.author,
                      style: GoogleFonts.poppins(
                        color: AppColors.grey2,
                        fontSize: 10,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          _fmt(_position),
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 5),
                        SizedBox(
                          width: 270,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 3,
                              thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 2,
                              ),
                              overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 12,
                              ),
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.white.withOpacity(
                                0.25,
                              ),
                              thumbColor: Colors.white,
                            ),
                            child: Slider(
                              value: progress.clamp(0.0, 1.0),
                              onChanged: _seekTo,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          _fmt(widget.duration),
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: _togglePlay,
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: const BoxDecoration(
                          color: Color(0xFF141316),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* ---------------------------------------------------------------
   ПРИМЕР ИСПОЛЬЗОВАНИЯ

   MiniPlayerCard(
     title: 'The good guy',
     author: 'Mark mcallister',
     coverImage: const AssetImage('assets/images/the_good_guy.jpg'),
     duration: const Duration(minutes: 5, seconds: 10),
     initialPosition: const Duration(minutes: 1, seconds: 14),
     onTap: () => context.go('/audio_player'),
   ),

   Если хотите привязать к реальному аудио-плееру (например, just_audio),
   замените внутренний Timer/_seekTo на подписку на
   audioPlayer.positionStream и вызов audioPlayer.seek() / play() / pause().
--------------------------------------------------------------- */
