//
//  TTWorkoutsIntent.swift
//  YZSiriKitDemo
//
//  Created by zhang liangwang on 16/7/27.
//  Copyright © 2016年 zhangliangwang. All rights reserved.
//

import UIKit

//锻炼
class TTWorkoutsIntent: NSObject, INStartWorkoutIntentHandling, INPauseWorkoutIntentHandling, INResumeWorkoutIntentHandling, INCancelWorkoutIntentHandling, INEndWorkoutIntentHandling{
    
    
    //MARK: -- Resolving
    func resolveIsOpenEnded(forStartWorkout intent: INStartWorkoutIntent, with completion: (INBooleanResolutionResult) -> Void) {
        let resolutionResult = INBooleanResolutionResult.success(with: false)
        completion(resolutionResult)
    }

    func resolveGoalValue(forStartWorkout intent: INStartWorkoutIntent, with completion: (INDoubleResolutionResult) -> Void) {
        let resolutionResult = INDoubleResolutionResult.success(with: 5)
        completion(resolutionResult)
    }
    
    func resolveWorkoutGoalUnitType(forStartWorkout intent: INStartWorkoutIntent, with completion: (INWorkoutGoalUnitTypeResolutionResult) -> Void) {
        let resolutionResult = INWorkoutGoalUnitTypeResolutionResult.success(with: .minute)
        completion(resolutionResult)
    }
    
    func resolveWorkoutLocationType(forStartWorkout intent: INStartWorkoutIntent, with completion: (INWorkoutLocationTypeResolutionResult) -> Void) {
        let resolutionResult = INWorkoutLocationTypeResolutionResult.success(with: .indoor)
        completion(resolutionResult)
    }
    
    func resolveWorkoutName(forStartWorkout intent: INStartWorkoutIntent, with completion: (INSpeakableStringResolutionResult) -> Void) {
        
        //The INSpeakableString's identifier would match the Vocabulary item synced up in the AppIntentVocabulary.plist
        let resolveWorkoutName = INSpeakableString(identifier: "latissimus_dorsi_pulldown", spokenPhrase: "Lat Pulldown", pronunciationHint: "lat pull down")
        let resolutionResult = INSpeakableStringResolutionResult.success(with: resolveWorkoutName)
        completion(resolutionResult)
    }
    
    //MARK: --Confirm
    func confirm(startWorkout intent: INStartWorkoutIntent, completion: (INStartWorkoutIntentResponse) -> Void) {
        let userActivity = NSUserActivity.init(activityType: String(INStartWorkoutIntent.self))
        let response = INStartWorkoutIntentResponse(code: .ready, userActivity: userActivity)
        completion(response)
    }
    
    
    //MARK: --Handing
    //MARK: --INStartWorkoutIntentHanding
    func handle(startWorkout intent: INStartWorkoutIntent, completion: (INStartWorkoutIntentResponse) -> Void) {
        // Implement your application logic to start a workout here
        // Update application state by updating NSUserActivity
        
        let userActivity = NSUserActivity.init(activityType: String(INStartWorkoutIntent.self))
        let response = INStartWorkoutIntentResponse(code: .continueInApp, userActivity: userActivity)
        completion(response)
    }
    
    //MARK: --INPauseWorkoutIntentHandling
    func handle(pauseWorkout intent: INPauseWorkoutIntent, completion: (INPauseWorkoutIntentResponse) -> Void) {
        // Implement your application logic to start a workout here
        let userActivity = NSUserActivity.init(activityType: String(INPauseWorkoutIntent.self))
        let response = INPauseWorkoutIntentResponse(code: .continueInApp, userActivity: userActivity)
        completion(response)
    }
    
    //MARK: --INResumeWorkoutIntentHandling
    func handle(resumeWorkout intent: INResumeWorkoutIntent, completion: (INResumeWorkoutIntentResponse) -> Void) {
        // Implement your application logic to resume a workout here
        let userActivity = NSUserActivity.init(activityType: String(INResumeWorkoutIntent.self))
        let response = INResumeWorkoutIntentResponse.init(code: .continueInApp, userActivity: userActivity)
        completion(response)
    }
    
    //MARK: --INCancelWorkoutIntentHandling
    func handle(cancelWorkout intent: INCancelWorkoutIntent, completion: (INCancelWorkoutIntentResponse) -> Void) {
        // Implement your application logic to cancel a workout here
        let userActivity = NSUserActivity.init(activityType: String(INCancelWorkoutIntent.self))
        let response = INCancelWorkoutIntentResponse.init(code: .continueInApp, userActivity: userActivity)
        completion(response)
    }
    
    //MARK: --INEndWorkoutIntentHandling
    func handle(endWorkout intent: INEndWorkoutIntent, completion: (INEndWorkoutIntentResponse) -> Void) {
        // Implement your application logic to end a workout here
        let userActivity = NSUserActivity.init(activityType: String(INEndWorkoutIntent.self))
        let response = INEndWorkoutIntentResponse.init(code: .continueInApp, userActivity: userActivity)
        completion(response)
    }
}













































































































