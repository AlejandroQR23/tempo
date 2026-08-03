import 'package:flutter/material.dart';
import 'package:tempo/theme/color_tokens.dart';

/// Design system tokens with no equivalent role in Material's
/// [ColorScheme] (e.g. `success` has no built-in slot — only
/// primary/secondary/tertiary/error do).
///
/// Access via `Theme.of(context).extension<TempoColors>()`.
class TempoColors extends ThemeExtension<TempoColors> {
  const TempoColors({
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.glowPrimary,
    required this.glowSecondary,
  });

  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;

  /// Soft accent shadow color for cards/buttons themed around [primary].
  final Color glowPrimary;

  /// Soft accent shadow color for cards/buttons themed around [secondary]
  /// (e.g. an active timer's progress ring glow).
  final Color glowSecondary;

  static const TempoColors dark = TempoColors(
    success: ColorTokens.success,
    onSuccess: ColorTokens.onSuccess,
    successContainer: ColorTokens.successContainer,
    onSuccessContainer: ColorTokens.onSuccessContainer,
    glowPrimary: ColorTokens.glowPrimary,
    glowSecondary: ColorTokens.glowSecondary,
  );

  @override
  TempoColors copyWith({
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? glowPrimary,
    Color? glowSecondary,
  }) {
    return TempoColors(
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      glowPrimary: glowPrimary ?? this.glowPrimary,
      glowSecondary: glowSecondary ?? this.glowSecondary,
    );
  }

  @override
  TempoColors lerp(covariant ThemeExtension<TempoColors>? other, double t) {
    if (other is! TempoColors) return this;
    return TempoColors(
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      successContainer: Color.lerp(
        successContainer,
        other.successContainer,
        t,
      )!,
      onSuccessContainer: Color.lerp(
        onSuccessContainer,
        other.onSuccessContainer,
        t,
      )!,
      glowPrimary: Color.lerp(glowPrimary, other.glowPrimary, t)!,
      glowSecondary: Color.lerp(glowSecondary, other.glowSecondary, t)!,
    );
  }
}
