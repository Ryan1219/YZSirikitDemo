//
//  ViewController.swift
//  YZSiriKitDemo
//
//  Created by zhang liangwang on 16/7/21.
//  Copyright © 2016年 zhangliangwang. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {

    
    var dict: NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGray()
        
        //请求Siri权限
        INPreferences.requestSiriAuthorization { (status) in
            switch status {
            case .authorized:
                print("user have author")
                
            case .notDetermined:
                print("user not determined")
            case .restricted:
                print("user restricted")
            case .denied:
                print("user deny author")
            default:
                print("default")
                
            }
        }
        
        
//        
//        let nameArray = ["健身仪","跑步","温度计","血压计"]
//        let orderSet = OrderedSet.init(array: nameArray)
//        INVocabulary.shared().setVocabularyStrings(orderSet, of: .workoutActivityName)
//        
        
        
        let testBtn = UIButton.init(frame: CGRect.init(x: 50, y: 150, width: 200, height: 44))
        testBtn.setTitle("Enter Run", for: .normal)
        testBtn.setTitleColor(UIColor.red(), for: .normal)
        testBtn.backgroundColor = UIColor.orange()
        testBtn.addTarget(self, action: #selector(ViewController.clickNext), for: .touchUpInside)
        self.view.addSubview(testBtn)
        
        
    }
    
    func clickNext() {
        
        let meaVC = TTMeasureWeightViewController()
        self.navigationController?.pushViewController(meaVC, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

