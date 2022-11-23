class JsonModel{
  List<GoalsDataModel> goals;
  List<DailyExerciseModel> exercise;
  JsonModel({required this.goals, required this.exercise});

  factory JsonModel.fromJson(Map<String, dynamic>json){
    var list1 = json['goals'] as List;
    List<GoalsDataModel> listGoals = list1.map((goals)=>
  GoalsDataModel.fromJson(goals)).toList();
    var list2= json['daily_exercise'] as List;
    List<DailyExerciseModel> listExercise = list2.map((exercise)=>
  DailyExerciseModel.fromJson(exercise)).toList();
    return JsonModel(
      goals: listGoals,
      exercise: listExercise
  );
  }
}

class GoalsDataModel{
  String? cover;
  String? title;
  String? sub_title;
  int? calories_count;
  int? duration_seconds;

  GoalsDataModel({this.cover, this.title, this.sub_title, this.calories_count,
      this.duration_seconds});


  factory GoalsDataModel.fromJson(Map<String, dynamic> json){
    return GoalsDataModel(
      cover:json['cover'],
      title:json['title'],
      sub_title:json['sub_title'],
      calories_count:json['calories_count'],
      duration_seconds:json['duration_seconds']);
  }
}

class DailyExerciseModel{
  String? title;
  String? cover;
  int? calories_count;
  int? duration_seconds;


  DailyExerciseModel({this.title, this.cover, this.calories_count,
      this.duration_seconds});

  factory DailyExerciseModel.fromJson(Map<String,dynamic>json){
    return DailyExerciseModel(
      title:json['title'],
      cover:json['cover'],
      calories_count:json['calories_count'],
      duration_seconds:json['duration_seconds']);
  }
}