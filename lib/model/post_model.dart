class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  bool? isRead;

  Post({required this.id, required this.userId, required this.title, required this.body,this.isRead});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      userId:  json['userId'],
      isRead:  json.containsKey("isRead") ? json['isRead'] : false,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['isRead'] = this.isRead;
    return data;
  }
}