class HoldToken {
  const HoldToken({
    required this.token,
    required this.expiresAt,
    required this.expiresInSeconds,
  });

  final String? token;
  final DateTime? expiresAt;
  final int? expiresInSeconds;

  factory HoldToken.fromJson(Map<String, dynamic> json) {
    return HoldToken(
      token: json['token'] as String?,
      expiresAt: json['expiresAt'] == null ? null : DateTime.parse(json['expiresAt'] as String),
      expiresInSeconds: json['expiresInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'expiresAt': expiresAt?.toIso8601String(),
      'expiresInSeconds': expiresInSeconds,
    };
  }

  @override
  String toString() {
    return '{"token": $token, "expiresAt": $expiresAt, "expiresInSeconds": $expiresInSeconds}';
  }
}
