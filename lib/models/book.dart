class Book {
  final String title;
  final String? author;
  final String? description;

  Book({
    required this.title,
    this.author,
    this.description,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    final info = json['volumeInfo'];

    return Book(
      title: info['title'] ?? "Без назви",
      author: info['authors'] != null ? info['authors'][0] : "Невідомий автор",
      description: info['description'] ?? "Опис відсутній",
    );
  }
}