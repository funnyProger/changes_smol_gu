class Petition {
  int id;
  String owner;
  int voices;
  String image;
  String title;
  String description;


  Petition({
    required this.id,
    required this.owner,
    required this.voices,
    required this.image,
    required this.title,
    required this.description
  });


  factory Petition.fromJson(Map<String, dynamic> json) {
    return Petition(
        id: json['id'],
        owner: json['owner'],
        voices: json['voices'],
        image: json['image'],
        title: json['title'],
        description: json['description']
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'owner': owner,
      'voices': voices,
      'image': image,
      'title': title,
      'description': description,
    };
  }
}