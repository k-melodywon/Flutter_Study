class Album {
  //데이터를 받아옴
  int? userId;
  int? id;
  String? title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJSON(Map<String, dynamic> json) => //factory: 받아온 데이터를 인스턴스로 만든다. 인스턴스 공장이라 이해하슈
      Album(userId: json['userId'], id: json['id'], title: json['title']);
}
