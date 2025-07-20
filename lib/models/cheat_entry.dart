class CheatEntry {
  final String title;
  final String syntax;
  final String notes;
  final String category;

  CheatEntry({
    required this.title,
    required this.syntax,
    required this.notes,
    required this.category,
  });

  factory CheatEntry.fromJson(Map<String, dynamic> json) {
    return CheatEntry(
      title: json['title'] ?? '',
      syntax: json['syntax'] ?? '',
      notes: json['notes'] ?? '',
      category: json['category'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'syntax': syntax,
      'notes': notes,
      'category': category,
    };
  }
}
