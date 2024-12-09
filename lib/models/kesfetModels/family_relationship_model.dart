class
FamilyRelationshipModel {
  final String task;
  final String description;
  final String duration;
  final int points;

  FamilyRelationshipModel({
    required this.task,
    required this.description,
    required this.duration,
    required this.points,
  });

  factory FamilyRelationshipModel.fromJson(Map<String, dynamic> json) {
    return FamilyRelationshipModel(
      task: json['task'],
      description: json['description'],
      duration: json['duration'],
      points: json['points'],
    );
  }

  get completed => false;

  Map<String, dynamic> toJson() {
    return {
      'task': task,
      'description': description,
      'duration': duration,
      'points': points,
    };
  }

}
