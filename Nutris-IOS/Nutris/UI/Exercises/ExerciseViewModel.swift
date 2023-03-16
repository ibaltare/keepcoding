import Foundation
import Combine

class ExerciseViewModel: ObservableObject {
    
    func getExcerciseTempData1() -> ExerciseModel{
        return ExerciseModel(id: 1, img: "Exercises", name: "Legs", level: "Beginner")
    }
    
    func getExcerciseTempData2() -> ExerciseModel{
        return ExerciseModel(id: 2, img: "aerobics", name: "Aerobics", level: "Beginner")
    }
    
    func getExcerciseTempData3() -> ExerciseModel{
        return ExerciseModel(id: 3, img: "abs", name: "Abs", level: "Intermediate")
    }
    
    func getExcerciseDetailData1() -> ExerciseDetailModel{
        return ExerciseDetailModel(video: server + "/video/legs1.mp4", name: "Jumping lunges", description: "Strong legs do more than look good. Even the simplest daily movements like walking require leg strength. This means that incorporating leg workouts into your routine is integral to your health.")
    }
    
    func getExcerciseDetailData2() -> ExerciseDetailModel{
        return ExerciseDetailModel(video: server + "/video/aerobics.mp4", name: "Aerobics", description: "Aerobic or 'with oxygen' exercises provide cardiovascular conditioning. The American Heart Association recommends a minimum of 30 minutes of cardiovascular exercise 5 to 7 days per week.")
    }
    
    func getExcerciseDetailData3() -> ExerciseDetailModel{
        return ExerciseDetailModel(video: server + "/video/abs.mp4", name: "Abs", description: "We live in an age where rock-hard, six-pack abdominal muscles are the goal of many workout enthusiasts.")
    }
    
}
