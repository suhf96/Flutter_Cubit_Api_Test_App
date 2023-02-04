class Posts {
  final int id;
  final String title;
  final String body;

  const Posts({
    required this.id,
    required this.title,
    required this.body,
  });

  factory Posts.fromMap(Map<String, dynamic> map) {
    return Posts(
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }
}
