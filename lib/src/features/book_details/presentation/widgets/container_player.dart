import 'dart:async';

import 'package:flutter/material.dart';
import 'package:third_exam/src/core/theme/app_colors.dart';

class ContainerPlayer extends StatefulWidget {
  const ContainerPlayer({super.key});

  @override
  State<ContainerPlayer> createState() => _ContainerPlayerState();
}

class _ContainerPlayerState extends State<ContainerPlayer> {
  @override
  Widget build(BuildContext context) {
    return MiniPlayers(
      title: 'Futurama',
      author: 'Kory Kogon, Suzette Blakemore, and James Wood',
      totalDuration: Duration(minutes: 5, seconds: 30), // пример длительности
    );
  }
}

class MiniPlayers extends StatefulWidget {
  final String title;
  final String author;
  final Duration totalDuration;

  const MiniPlayers({
    super.key,
    required this.title,
    required this.author,
    required this.totalDuration,
  });

  @override
  State<MiniPlayers> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayers> {
  late Duration _position;
  late Duration _total;
  bool _isPlaying = false;
  Timer? _timer;

  // Список доступных скоростей воспроизведения
  final List<double> _speeds = [0.5, 0.75, 1.0, 1.25, 1.5, 2.0];
  int _speedIndex = 2; // по умолчанию 1.0x

  @override
  void initState() {
    super.initState();
    _position = Duration.zero;
    _total = widget.totalDuration;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  double get _currentSpeed => _speeds[_speedIndex];

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      setState(() {
        final increment = Duration(milliseconds: (200 * _currentSpeed).round());
        if (_position + increment >= _total) {
          _position = _total;
          _isPlaying = false;
          _timer?.cancel();
        } else {
          _position += increment;
        }
      });
    });
  }

  void _togglePlay() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
    if (_isPlaying) {
      _startTimer();
    } else {
      _timer?.cancel();
    }
  }

  void _seekBy(int seconds) {
    setState(() {
      final newPos = _position + Duration(seconds: seconds);
      if (newPos < Duration.zero) {
        _position = Duration.zero;
      } else if (newPos > _total) {
        _position = _total;
      } else {
        _position = newPos;
      }
    });
  }

  void _seekTo(double value) {
    setState(() {
      _position = Duration(milliseconds: value.round());
    });
  }

  void _cycleSpeed() {
    setState(() {
      _speedIndex = (_speedIndex + 1) % _speeds.length;
    });
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(1, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  String _formatRemaining(Duration remaining) {
    final minutes = remaining.inMinutes.remainder(60);
    final seconds = remaining.inSeconds
        .remainder(60)
        .toString()
        .padLeft(2, '0');
    return '-$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final remaining = _total - _position;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'By ${widget.author}',
          style: const TextStyle(color: Colors.white54, fontSize: 13),
        ),
        const SizedBox(height: 16),

        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 2,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 12),
            activeTrackColor: Colors.white,
            inactiveTrackColor: Colors.white24,
            thumbColor: Colors.white,
          ),
          child: Slider(
            min: 0,
            max: _total.inMilliseconds.toDouble().clamp(1, double.infinity),
            value: _position.inMilliseconds.toDouble().clamp(
              0,
              _total.inMilliseconds.toDouble(),
            ),
            onChanged: (value) => _seekTo(value),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDuration(_position),
                style: const TextStyle(color: Colors.white54, fontSize: 12),
              ),
              Text(
                _formatRemaining(remaining),
                style: const TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: .center,
          children: [
            _RoundIconButton(
              image: Image.asset('assets/images/skip_behind.png'),
              onTap: () {},
              size: 26,
            ),
            Spacer(),
            _SkipButton(
              seconds: 10,
              isForward: false,
              onTap: () => _seekBy(-10),
            ),
            SizedBox(width: 31),
            _RoundIconButton(
              h: 64,
              w: 64,
              image: _isPlaying
                  ? Image.asset('assets/images/pause.png', fit: .contain)
                  : Image.asset('assets/images/player.png'),
              onTap: _togglePlay,
              background: AppColors.accentGreen,

              padding: 16,
            ),
            SizedBox(width: 31),
            _SkipButton(seconds: 10, isForward: true, onTap: () => _seekBy(10)),
            Spacer(),
            _RoundIconButton(
              image: Image.asset('assets/images/skip_forward.png'),
              onTap: () {},
              size: 26,
            ),
          ],
        ),
        const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.bedtime_outlined, color: Colors.white70),
              onPressed: () {},
            ),
            TextButton(
              onPressed: _cycleSpeed,
              child: Text(
                '${_currentSpeed}x'.replaceAll('.0x', '.0x'),
                style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  final double? h;
  final double? w;
  final Image image;
  final VoidCallback onTap;
  final double? size;
  final Color? background;
  final double padding;

  const _RoundIconButton({
    required this.image,
    required this.onTap,
    this.size,
    this.background,
    this.padding = 8,
    this.h,
    this.w,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      child: Container(
        height: h,
        width: w,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(color: background, shape: BoxShape.circle),
        child: image,
      ),
    );
  }
}

class _SkipButton extends StatelessWidget {
  final int seconds;
  final bool isForward;
  final VoidCallback onTap;

  const _SkipButton({
    required this.seconds,
    required this.isForward,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            isForward
                ? Image.asset('assets/images/skip10_forward.png')
                : Image.asset('assets/images/skip10_behind.png'),
          ],
        ),
      ),
    );
  }
}
