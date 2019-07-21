//
//  ViewController.swift
//  dbtoview
//
//  Created by Abshir Mohamed on 7/20/19.
//  Copyright © 2019 Abshir Mohamed. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    
    var imgs:[Images] = []
    var caption:String?;
    var apiCaption:String?;
    var url:String?;
    var isDescribed:String?;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let ref = Database.database().reference()
        
        ref.child("2").observeSingleEvent(of: .value)
        {
            //Retrieves one value from specified key
            (snapshot) in let response = snapshot.value as? String
            
        }
        
    
//        for i in 1...11{
//            //database is missing the number 3
//            if(i != 3)
//            {
//                ref.child("\(String(i))/caption").observeSingleEvent(of: .value)
//                {
//                    //Retrieves one value from specified key
//                    (snapshot) in let response = snapshot.value as? String
//                    self.caption = response
//                }
//
//                ref.child("\(String(i))/apicaption").observeSingleEvent(of: .value)
//                {
//                    //Retrieves one value from specified key
//                    (snapshot) in let response = snapshot.value as? String
//
//                    self.apiCaption = response
//                }
//
//                ref.child("\(String(i))/url").observeSingleEvent(of: .value)
//                {
//                    //Retrieves one value from specified key
//                    (snapshot) in let response = snapshot.value as? String
//
//                    self.url = response
//                }
//                ref.child("\(String(i))/isDescribed").observeSingleEvent(of: .value)
//                {
//                    //Retrieves one value from specified key
//                    (snapshot) in let response = snapshot.value as? String
//
//                    self.isDescribed = response
//                }
//
//
//
//            }
//
//        }
        
    }


}

