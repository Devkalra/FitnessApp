import 'dart:js';

import 'package:fitness_app/Pages/workout_page.dart';
import 'package:fitness_app/modules/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text Controller (used to access what user has typed)
  final newWorkoutNameController = TextEditingController();
  // create a new workout
  void createNewWorkout() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Create a new workout"),
              content: TextField(
                controller: newWorkoutNameController,
              ),
              actions: [
                //save button
                MaterialButton(
                  onPressed: save,
                  child: Text("save"),
                ),

                //cancel button
                MaterialButton(
                  onPressed: cancel,
                  child: Text("cancel"),
                ),
              ],
            ));
  }

  //go to workout page
  void goToWorkoutPage(String workoutName){
    Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) => WorkoutPage(
        workoutName: workoutName,
    ),
        ));

  }

  //save workout
  void save() {
    //get workout name from text controller
    String newWorkoutName = newWorkoutNameController.text;
    // add workout to workout list
    Provider.of<WorkoutData>(context, listen: false)
        .addWorkout((newWorkoutName));
    //pop our dailog
    Navigator.pop(context);
    clear();
  }

  //cancel
  void cancel() {
    //pop our dailog
    Navigator.pop(context);
    clear();
  }

  //clear Controllers
  void clear() {
    newWorkoutNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    // to conusme our data from user list we will use the "consumer"
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Fitness App',
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: createNewWorkout, child: Icon(Icons.add)),
        body: ListView.builder(
          itemCount: value.getWorkoutList().length,
          itemBuilder: (context, index) => ListTile(
            title: Text(value.getWorkoutList()[index].name),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios,), 
              onPressed:  () => goToWorkoutPage(value.getWorkoutList().name),
            
          ),
        ),
      ),
    );
  }
}
