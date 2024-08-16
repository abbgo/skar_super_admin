class Brend {
  final String id, name, image;

  const Brend({required this.id, required this.name, required this.image});

  factory Brend.defaultBrend() {
    return const Brend(id: '', name: '', image: '');
  }

  factory Brend.fromJson(Map<String, dynamic> json) {
    return Brend(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
