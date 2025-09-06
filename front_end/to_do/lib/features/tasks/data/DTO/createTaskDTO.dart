class CreateTaskDTO{

  final String title;
  final String description;


  CreateTaskDTO({required this.title, required this.description, });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,

    };
  }
}