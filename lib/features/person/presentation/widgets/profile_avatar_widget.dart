import 'package:flutter/material.dart';

/// Profile avatar with an edit badge, name and email.
///
/// Built from a 180 x 154 design box and scaled uniformly with [width],
/// so proportions never distort. Background is transparent.
class ProfileAvatarWidget extends StatelessWidget {
  const ProfileAvatarWidget({
    super.key,
    required this.image,
    required this.name,
    required this.email,
    this.onEditTap,
    this.width = _designWidth,
  });

  /// e.g. `NetworkImage(url)` or `AssetImage('assets/avatar.jpg')`.
  final ImageProvider image;
  final String name;
  final String email;
  final VoidCallback? onEditTap;

  /// Rendered width; height follows the 180:154 aspect ratio.
  final double width;

  static const double _designWidth = 180;
  static const double _designHeight = 154;

  static const Color _badgeBackground = Color(0xFF252836);
  static const Color _badgeBorder = Color(0xFF1F1D2B);
  static const Color _accent = Color(0xFF12CDD9);
  static const Color _emailColor = Color(0xFFB1B1B1);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: width * _designHeight / _designWidth,
      child: FittedBox(
        fit: BoxFit.contain,
        child: SizedBox(
          width: _designWidth,
          height: _designHeight,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Avatar: 72x72 at (54, 16). Shadow: dy 4, blur 10 sigma
              // (= 20 blur radius), black at 6% opacity.
              Positioned(
                left: 54,
                top: 16,
                width: 72,
                height: 72,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0F000000),
                        offset: Offset(0, 4),
                        blurRadius: 20,
                      ),
                    ],
                    image: DecorationImage(image: image, fit: BoxFit.cover),
                  ),
                ),
              ),
              // Edit badge: 32x32 (31 + 1px stroke) centered at (114, 77).
              Positioned(
                left: 98,
                top: 61,
                child: GestureDetector(
                  onTap: onEditTap,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _badgeBackground,
                      border: Border.all(color: _badgeBorder),
                    ),
                    child: const Icon(Icons.edit, size: 16, color: _accent),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 107,
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 136,
                child: Text(
                  email,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: _emailColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
