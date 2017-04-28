//
//  TTSendMessageIntent.swift
//  YZSiriKitDemo
//
//  Created by zhang liangwang on 16/7/26.
//  Copyright © 2016年 zhangliangwang. All rights reserved.
//

import UIKit
import Intents

//发送消息
class TTSendMessageIntent: NSObject, INSendMessageIntentHandling {
    
    
    //MARK: 1,--Resolving
    func resolveRecipients(forSendMessage intent: INSendMessageIntent, with completion: ([INPersonResolutionResult]) -> Void) {
        
        if let recipients = intent.recipients {
    
            var resolutionResults = [INPersonResolutionResult]()
            for recipient in recipients {
                let match = UCAddressBookManager().contacts(matchingName: recipient.displayName)
                
                switch match.count {
                case 2...Int.max:
                    
                    let disambiguationOptions: [INPerson] = match.map { contact in
                        return contact.inPerson()
                    }
                    resolutionResults += [.disambiguation(with: disambiguationOptions)]
                    
                case 1:
                    let recipientMatched = match[0].inPerson()
                    resolutionResults += [.success(with:recipientMatched)]
                    
                case 0:
                    resolutionResults += [.unsupported()]
            
                default:
                    break
                }
            }
            completion(resolutionResults)
        } else {
            // No recipients are provided we need to prompt for a value
            completion([INPersonResolutionResult.needsValue()])
        }
    }
    
    
    func resolveContent(forSendMessage intent: INSendMessageIntent, with completion: (INStringResolutionResult) -> Void) {
        
        if let text = intent.content where !text.isEmpty {
            completion(INStringResolutionResult.success(with: text))
        } else {
            completion(INStringResolutionResult.needsValue())
        }
        
    }
    
    //MARK: --2,Confirm
    func confirm(sendMessage intent: INSendMessageIntent, completion: (INSendMessageIntentResponse) -> Void) {
        
        if UCAccount.shared().hasValidAuthentication {
            let response = INSendMessageIntentResponse.init(code: .success, userActivity: nil)
            completion(response)
        } else {
            // creating our own user activity to include error information
            let userActivity = NSUserActivity.init(activityType: String(INSendMessageIntent.self))
            userActivity.userInfo = [NSString(string: "error"):NSString(string: "UserLogOut")]
            completion(INSendMessageIntentResponse.init(code: .failureRequiringAppLaunch, userActivity: userActivity))
        }
    }


    //MARK: 3,--Handing & INSendMessageIntentHandling
    func handle(sendMessage intent: INSendMessageIntent, completion: (INSendMessageIntentResponse) -> Void) {
        
        if intent.recipients != nil && intent.content != nil {
            let success = UCAccount.shared().sendMessage(intent.content, toRecipients: intent.recipients)
            let response = INSendMessageIntentResponse.init(code: success ? .success : .failure, userActivity: nil)
             completion(response)
        } else {
            let response = INSendMessageIntentResponse.init(code: .failure, userActivity: nil)
            completion(response)
        }
        
    }
}























































































