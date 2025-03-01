class AnimeQuote {
  final String content;
  final String animeName;
  final String animeAltName;
  final String characterName;

  AnimeQuote({
    required this.content,
    required this.animeName,
    required this.animeAltName,
    required this.characterName,
  });

  factory AnimeQuote.fromJson(Map<String, dynamic> json) {
    return AnimeQuote(
      content: json['data']['content'] ?? 'No content available',
      animeName: json['data']['anime']['name'] ?? 'Unknown',
      animeAltName: json['data']['anime']['altName'] ?? 'Unknown',
      characterName: json['data']['character']['name'] ?? 'Unknown',
    );
  }
}
