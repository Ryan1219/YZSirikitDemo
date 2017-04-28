//
//  IntentViewController.swift
//  YZSirikitIntentsUI
//
//  Created by zhang liangwang on 16/7/21.
//  Copyright © 2016年 zhangliangwang. All rights reserved.
//

import IntentsUI

// As an example, this extension's Info.plist has been configured to handle interactions for INStartWorkoutIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Start my workout using <myApp>"

class IntentViewController: UIViewController, INUIHostedViewControlling,INUIHostedViewSiriProviding {
    
    
//    @IBOutlet var titleLabel: UILabel!
//    @IBOutlet var siriImageView: UIImageView!
//    
//    @IBOutlet var cancelBtn: UIButton!
//    @IBOutlet var confirmBtn: UIButton!
//    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("start show siri ui")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("show siri ui")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - INUIHostedViewControlling
    // Prepare your view controller for the interaction to handle.
    func configure(with interaction: INInteraction!, context: INUIHostedViewContext, completion: ((CGSize) -> Void)!) {
        // Do configuration here, including preparing views and calculating a desired size for presentation.
        
//        var size: CGSize
//        if interaction.representsSendMessageIntent {
//            
//             let chartVC = UCChatViewController()
//             chartVC.messageContent = interaction.messageContent
//            
//            let contact = UCContact()
//            contact.name = interaction.recipientName
//            chartVC.recipient = contact
//            
//            switch interaction.intentHandlingStatus {
//            case .unspecified, .inProgress, .ready, .failure:
//                chartVC.isSent = false
//            case .done, .deferredToApplication:
//                chartVC.isSent = true
//                
//            }
//            present(chartVC, animated: false, completion: nil)
//            size = desiredSize
//
//        } else {
//            
//            size = CGSize.zero
//        }
//        completion(size)
        
        if let completion = completion {
            completion(self.desiredSize)
        }
        
    }
    
    var desiredSize: CGSize {
        return self.extensionContext!.hostedViewMaximumAllowedSize
    }
    
    //MARK: -- INUIHostedViewSiriProviding 隐藏系统的UI界面
    var displaysMessage: Bool {
        return true
    }
    
//    var displaysMap: Bool {
//        return true
//    }
    
    
    //MARK: -- UIButton Action
//    @IBAction func clickCancelBtn(_ sender: UIButton) {
//        
//        
//    }
//    
//    @IBAction func clickConfirmBtn(_ sender: UIButton) {
//        
//    }
}






























































