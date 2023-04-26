import 'package:fitness_app/modules/exercise.dart';
import 'package:fitness_app/modules/workout.dart';
import 'package:flutter/cupertino.dart';

class WorkoutData extends ChangeNotifier{
  /*
  DATA
  */


  List<Workout> workoutList = [
    //default
    Workout(
      name:"ABCP",
      exercises: [
        Exercise(name: 'chest',
        ),
      ],
    ),
    Workout(
      name:"ABCw",
      exercises: [
        Exercise(name: 'Back',
        ),
      ],
    )
];


  //get the list of workout
  List<Workout> getWorkoutList(){
    return workoutList;
  }
  //get length of a workout
  int numberofExerciseInWorkout(String workoutName){
    Workout relevantWorkout = getRelevantWorkout(workoutName);

    return relevantWorkout.exercises.length;
  }

  // add a workout
  void addWorkout(String name){

    //add a new workout with a blank list
    workoutList.add(Workout(name: name, exercises: []));
    //using this update the state
    notifyListeners();
  }

  // add an exercise
  void addExercise(String workoutName, String exerciseName,) {


    //find the relevant workout
    Workout relevantWorkout = getRelevantWorkout(workoutName);

    relevantWorkout.exercises.add(
        Exercise(
          name: exerciseName,
        ),
    );
    notifyListeners();
  }
  //check off
  void checkoffExercise(String workoutName, String exerciseName){
    //find relvant exercise in that workout
  Exercise relevantExercise = getRelevantExercise(workoutName, exerciseName);

  //check off the bollean to show user exercise done
  relevantExercise.isCompleted = !relevantExercise.isCompleted;
  notifyListeners();
  }

  // return relvant workout object
Workout getRelevantWorkout(String workoutName){
    Workout relevantWorkout =
        workoutList.firstWhere((workout) => workout.name == workoutName);
    return relevantWorkout;
}
// return relevant exercise object

  Exercise getRelevantExercise(String workoutName, String exerciseName){
    // find relevant workout first

    Workout relevantWorkout = getRelevantWorkout(workoutName);

    //find the relevant exercise
    Exercise relevantExercise =
        relevantWorkout.exercises.firstWhere((exercise) => exercise.name == exerciseName);

    return relevantExercise;


  }


}