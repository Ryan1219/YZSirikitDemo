//
//  IntentHandler.swift
//  YZSirikitIntents
//
//  Created by zhang liangwang on 16/7/21.
//  Copyright © 2016年 zhangliangwang. All rights reserved.
//

import Intents

// As an example, this class is set up to handle the Workout intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

// You can test your example integration by saying things to Siri like:
// "Start my workout using <myApp>"
// "Pause my workout using <myApp>"
// "Resume my workout using <myApp>"
// "Cancel my workout using <myApp>"
// "End my workout using <myApp>"




//MARK: --TTMatch
//class TTMatch {
//    
//    var handel: String!
//    var displayName: String!
//    var contactIdentifier: String!
//    convenience init(handle: String,displayName: String,contactIdentifier: String) {
//        self.init()
//        self.handel = handle
//        self.displayName = displayName
//        self.contactIdentifier = contactIdentifier
//    }
//    
//    func inPerson() -> INPerson {
//        return INPerson(handle: self.handel, displayName: self.displayName, contactIdentifier: self.contactIdentifier)
//    }
//}
//

//MARK: --TTAccount
//class TTAccount {
//    private static let instance = TTAccount()
//    private init() {
//        print("only call share() to get an instance of TTAccount")
//    }
//    
//    class func share() -> TTAccount {
//        return TTAccount.instance
//    }
//    
//    func contact(matchingName: String) -> [TTMatch] {
//        return [TTMatch(handle: NSStringFromClass(IntentHandler.classForCoder()), displayName: matchingName, contactIdentifier: matchingName)]
//    }
//    
//    func send(message: String,to recipients: [INPerson]) -> INSendMessageIntentResponseCode {
//        
//        return .success
//    }
//    
//}





class IntentHandler: INExtension {
    
    
    override func handler(for intent: INIntent) -> AnyObject? {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
       // MARK: --INSendMessageIntent
//        if intent is INSendMessageIntent {
//            return TTSendMessageIntent()
//        }
//        return nil
        
        //MARK: --INStartWorkoutIntent
//        if intent is INStartWorkoutIntent && intent is INPauseWorkoutIntent && intent is INResumeWorkoutIntent && intent is INCancelWorkoutIntent && intent is INEndWorkoutIntent {
//            return TTWorkoutsIntent()
//        }
//        return nil
        
//        if intent is INSendPaymentIntent {
//            return TTSendPaymentIntentHandler()
//        }
//        return nil
        
        
        //MARK: --INSendPaymentIntent
        if intent is INSendPaymentIntent {
            return TTSendPaymentIntentHandler()
        }
        return nil
        

    }
    
//    override func handler(for intent: INIntent) -> AnyObject? {
//        
//        return self
//    }
}
    
    
    
    
    






    
    /*
    
    
    //MARK: --INSendMessageIntentHandling
    //MARK: --Resolving
    func resolveRecipients(forSendMessage intent: INSendMessageIntent, with completion: ([INPersonResolutionResult]) -> Void) {
        
        if let recipients = intent.recipients {
            
            var resolutionResults = [INPersonResolutionResult]()
            for recipient in recipients {
                let matchs = TTAccount.share().contact(matchingName: recipient.displayName)
                switch matchs.count {
                case 2...Int.max: //俩个或更多匹配结果
                    let disambiguations = matchs.map { $0.inPerson() }
                    resolutionResults.append(INPersonResolutionResult.disambiguation(with: disambiguations))
                    break
                case 1:
                    let recipient = matchs[0].inPerson()
                    resolutionResults.append(INPersonResolutionResult.success(with: recipient))
                    break
                case 0:
                    resolutionResults.append(INPersonResolutionResult.unsupported())
                default:
                    break
                }
            }
            completion(resolutionResults)
        } else {
            completion([INPersonResolutionResult.needsValue()])
        }
    }
    
    // http://www.cocoachina.com/ios/20160622/16785.html  Siri开发
    // http://www.cocoachina.com/swift/20160720/17123.html 关于如何获取Siri上的内容，并对空值进行判断
    func resolveContent(forSendMessage intent: INSendMessageIntent, with completion: (INStringResolutionResult) -> Void) {
        
        if let content = intent.content  where !content.isEmpty {
            let message = "Dictated text: \(content)"
            print("-----message---",message)
            let response = INStringResolutionResult.success(with: message)
            completion(response)
        } else {
            // 向用户征询发送的消息内容
            let response = INStringResolutionResult.needsValue()
            completion(response)
        }
    }
    
    
    //MARK: --confirm   
    //Confirm阶段是我们最后可以尝试修改intent事件中传递的数值的时候。要记住一点，完全精确的内容固然是最好的答案，但是过多的让Siri询问用户参数的详细信息也会导致用户的抵触。
    func confirm(sendMessage intent: INSendMessageIntent, completion: (INSendMessageIntentResponse) -> Void) {
        //        let content = intent.content
        //        let recipients = intent.recipients
        
        //        let userActivity = NSUserActivity(activityType: NSStringFromClass(INSendMessageIntent.self))
        //        let response = INSendMessageIntentResponse.init(code: .success, userActivity: userActivity)
        //        completion(response)
        
        let response = INSendMessageIntentResponse.init(code: .success, userActivity: nil)
        completion(response)
        
    }
 
   */
    
    
    //MARK: --Resolving
//    func resolveContent(forSendMessage intent: INSendMessageIntent, with completion: (INStringResolutionResult) -> Void) {
//        
//        if let content = intent.content {
//            let message = "Dictated text: \(content)"
//            print("--message--",message)
//            let response = INStringResolutionResult.success(with: message)
//            completion(response)
//        } else {
//            let response = INStringResolutionResult.needsValue()
//            completion(response)
//        }
//    }
    
    //MARK: -- handing
//    func handle(sendMessage intent: INSendMessageIntent, completion: (INSendMessageIntentResponse) -> Void) {
//        print("Message intent is being handled")
//        
//        let userActivity = NSUserActivity(activityType: String(INSendMessageIntent.self))
//        let response = INSendMessageIntentResponse.init(code: .success, userActivity: userActivity)
//        completion(response)
    
//        if intent.recipients != nil && intent.content != nil {
//            let success = TTAccount.share().send(message: intent.content!, to: intent.recipients!)
//            completion(INSendMessageIntentResponse(code: success, userActivity: nil))
//        } else {
//            let userActivity = NSUserActivity(activityType: String(INSendMessageIntent.self))
//            userActivity.userInfo = [NSString(string: "error") : String("AppDidNotLaunch")]
//            completion(INSendMessageIntentResponse(code: .failure,userActivity: userActivity))
//            
//        }
        
        
//    }

    
    //MARK:--INSearchForMessagesIntentHandling
//    func handle(searchForMessages intent: INSearchForMessagesIntent, completion: (INSearchForMessagesIntentResponse) -> Void) {
//        let userActivity = NSUserActivity.init(activityType: NSStringFromClass(INSearchForMessagesIntent.self))
//        let response = INSearchForMessagesIntentResponse.init(code: .success, userActivity: userActivity)
//        completion(response)
//    }
    

    
    
    
    
    
    
    
    
    
    
    

    

/*
    
    // MARK: - INStartWorkoutIntentHandling
    // Implement resolution methods to provide additional information about your intent (optional).
    func resolveIsOpenEnded(forStartWorkout intent: INStartWorkoutIntent, with completion: (INBooleanResolutionResult) -> Void) {
        let resolutionResult = INBooleanResolutionResult.success(with: false)
        completion(resolutionResult)
    }
    
    func resolveGoalValue(forStartWorkout intent: INStartWorkoutIntent, with completion: (INDoubleResolutionResult) -> Void) {
        let resolutionResult = INDoubleResolutionResult.success(with: 5)
        completion(resolutionResult)
    }
    
    func resolveWorkoutGoalUnitType(forStartWorkout intent: INStartWorkoutIntent, with completion: (INWorkoutGoalUnitTypeResolutionResult) -> Void) {
        let resolutionResult = INWorkoutGoalUnitTypeResolutionResult.success(with: INWorkoutGoalUnitType.minute)
        completion(resolutionResult)
    }
    
    func resolveWorkoutLocationType(forStartWorkout intent: INStartWorkoutIntent, with completion: (INWorkoutLocationTypeResolutionResult) -> Void) {
        let resolutionResult = INWorkoutLocationTypeResolutionResult.success(with: INWorkoutLocationType.indoor)
        completion(resolutionResult)
    }
    
    func resolveWorkoutName(forStartWorkout intent: INStartWorkoutIntent, with completion: (INSpeakableStringResolutionResult) -> Void) {
        // The INSpeakableString's identifier would match the Vocabulary item synced up in the AppIntentVocabulary.plist
        let resolvedWorkoutName = INSpeakableString(identifier: "latissimus_dorsi_pulldown", spokenPhrase: "Lat Pulldown", pronunciationHint: "lat pull down")
        let resolutionResult = INSpeakableStringResolutionResult.success(with: resolvedWorkoutName)
        completion(resolutionResult)
    }
    
    // Once resolution is completed, perform validation on the intent and provide confirmation (optional).
    
    func confirm(startWorkout startWorkoutIntent: INStartWorkoutIntent, completion: (INStartWorkoutIntentResponse) -> Void) {
        let userActivity = NSUserActivity(activityType: NSStringFromClass(INStartWorkoutIntent.self))
        let response = INStartWorkoutIntentResponse(code: .ready, userActivity: userActivity)
        completion(response)
    }
    
    // Handle the completed intent (required).
    
    func handle(startWorkout startWorkoutIntent: INStartWorkoutIntent, completion: (INStartWorkoutIntentResponse) -> Void) {
        // Implement your application logic to start a workout here.
        
        // Update application state by updating NSUserActivity.
        let userActivity = NSUserActivity(activityType: NSStringFromClass(INStartWorkoutIntent.self))
        let response = INStartWorkoutIntentResponse(code: .continueInApp, userActivity: userActivity)
        completion(response)
    }
    
    // Implement handlers for each intent you wish to handle.  As an example for workouts, you may wish to handle pause, resume, cancel, and end.
    
    // MARK: - INPauseWorkoutIntentHandling
    
    func handle(pauseWorkout pauseWorkoutIntent: INPauseWorkoutIntent, completion: (INPauseWorkoutIntentResponse) -> Void) {
        // Implement your application logic to pause a workout here.
        
        let userActivity = NSUserActivity(activityType: NSStringFromClass(INPauseWorkoutIntent.self))
        let response = INPauseWorkoutIntentResponse(code: .continueInApp, userActivity: userActivity)
        completion(response)
    }
    
    // MARK: - INResumeWorkoutIntentHandling
    
    func handle(resumeWorkout resumeWorkoutIntent: INResumeWorkoutIntent, completion: (INResumeWorkoutIntentResponse) -> Void) {
        // Implement your application logic to resume a workout here.
        
        let userActivity = NSUserActivity(activityType: NSStringFromClass(INResumeWorkoutIntent.self))
        let response = INResumeWorkoutIntentResponse(code: .continueInApp, userActivity: userActivity)
        completion(response)
    }
    
    // MARK: - INCancelWorkoutIntentHandling
    
    func handle(cancelWorkout cancelWorkoutIntent: INCancelWorkoutIntent, completion: (INCancelWorkoutIntentResponse) -> Void) {
        // Implement your application logic to cancel a workout here.
        
        let userActivity = NSUserActivity(activityType: NSStringFromClass(INCancelWorkoutIntent.self))
        let response = INCancelWorkoutIntentResponse(code: .continueInApp, userActivity: userActivity)
        completion(response)
    }
    
    // MARK: - INEndWorkoutIntentHandling
    
    func handle(endWorkout endWorkoutIntent: INEndWorkoutIntent, completion: (INEndWorkoutIntentResponse) -> Void) {
        // Implement your application logic to end a workout here.
        
        let userActivity = NSUserActivity(activityType: NSStringFromClass(INEndWorkoutIntent.self))
        let response = INEndWorkoutIntentResponse(code: .continueInApp, userActivity: userActivity)
        completion(response)
    }
}
 
 */
 
 
 
 
 
 
 
 
 
 

