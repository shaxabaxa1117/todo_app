class CreateTaskParms{

  final String title;
  final String description;


  CreateTaskParms({required this.title, required this.description, });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,

    };
  }
}