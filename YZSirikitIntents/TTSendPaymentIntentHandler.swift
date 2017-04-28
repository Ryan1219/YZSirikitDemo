//
//  TTSendPaymentIntentHandler.swift
//  YZSiriKitDemo
//
//  Created by zhang liangwang on 16/7/29.
//  Copyright © 2016年 zhangliangwang. All rights reserved.
//

import UIKit
import Intents

class TTSendPaymentIntentHandler: NSObject, INSendPaymentIntentHandling{
    
    let paymentThreshold: Int = 50
    
    //MARK: --Handling
    func handle(sendPayment intent: INSendPaymentIntent, completion: (INSendPaymentIntentResponse) -> Void) {
    
        if let _ = intent.payee, let currencyAmount = intent.currencyAmount {
            
            if Int(currencyAmount.amount!) >= paymentThreshold {
                
                let userActivity = NSUserActivity()
                userActivity.userInfo = ["currencyAmount": Int(currencyAmount.amount!)]
                userActivity.requiredUserInfoKeys = Set(["currencyAmount"])
                
                completion(INSendPaymentIntentResponse.init(code: .success, userActivity: userActivity))
            } else {
                
                completion(INSendPaymentIntentResponse.init(code: .success, userActivity: nil))
            }
        } else {
            completion(INSendPaymentIntentResponse.init(code: .success, userActivity: nil))
            
        }
    }
    
    
    //MARK: --Resolving
    func resolvePayee(forSendPayment intent: INSendPaymentIntent, with completion: (INPersonResolutionResult) -> Void) {
        
        if let payee = intent.payee {
            let contacts = PaymentsContact.allContacts()
            var resolotionResult: INPersonResolutionResult?
            var matchedContacts: [PaymentsContact] = []
            
            for contact in contacts {
                print("Checking '\(contact.name)' against '\(payee.displayName)'")
                if contact.name == payee.displayName {
                    matchedContacts.append(contact)
                }
            }
            
            switch matchedContacts.count {
            case 2...Int.max:
                let disambiguationOptions: [INPerson] = matchedContacts.map{ (contact) in
                    return contact.inPerson()
                }
                resolotionResult = INPersonResolutionResult.disambiguation(with: disambiguationOptions)
            case 1:
                let recipientMatched = matchedContacts[0].inPerson()
                print("Matched a recipient: \(recipientMatched.displayName)")
                resolotionResult = INPersonResolutionResult.success(with: recipientMatched)
            default:
                break
            }
            completion(resolotionResult!)
        } else {
            completion(INPersonResolutionResult.needsValue())
        }
    }

}



























































