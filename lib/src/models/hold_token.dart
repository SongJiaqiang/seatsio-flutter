class HoldToken {
  const HoldToken({
    required this.token,
    required this.expiresAt,
    required this.expiresInSeconds,
  });

  final String? token;
  final DateTime? expiresAt;
  final int? expiresInSeconds;

  factory HoldToken.fromString(String? token) {
    return HoldToken(
      token: token,
      expiresAt: DateTime.now().add(const Duration(minutes: 10)),
      expiresInSeconds: 600,
    );
  }

  factory HoldToken.fromJson(Map<String, dynamic> json) {
    return HoldToken(
      token: json['token'] as String?,
      expiresAt: json['expiresAt'] == null ? null : DateTime.parse(json['expiresAt'] as String),
      expiresInSeconds: json['expiresInSeconds'] as int?,
    );
  }

  @override
  String toString() {
    return 'TokenModel(token: $token, expiresAt: $expiresAt, expiresInSeconds: $expiresInSeconds)';
  }
}
