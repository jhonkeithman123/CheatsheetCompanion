class CheatEntry {
  final String title;
  final String? syntax;
  final String notes;
  final String category;
  final String? difficulty;

  CheatEntry({
    required this.title,
    this.syntax,
    required this.notes,
    required this.category,
    this.difficulty,
  });

  factory CheatEntry.fromJson(Map<String, dynamic> json) {
    return CheatEntry(
      title: json['title'] ?? '',
      syntax: json['syntax'] ?? '',
      notes: json['notes'] ?? '',
      category: json['category'] ?? '',
      difficulty: json['difficulty'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'syntax': syntax,
      'notes': notes,
      'category': category,
      'difficulty': difficulty,
    };
  }
}
