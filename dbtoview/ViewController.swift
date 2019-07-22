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
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let ref = Database.database().reference()
        
    //retrieve data from db and store in image objects array
        for i in 1...11{
            //database is missing the number 3
            if(i != 3)
            {
                ref.child(String(i)).observeSingleEvent(of: .value, with: { (snapshot) in
                    // Get user value
                    let value = snapshot.value as? NSDictionary
                    let caption = value?["caption"] as? String ?? ""
                    let apiCaption = value?["apiCaption"] as? String ?? ""
                    let url = value?["url"] as? String ?? ""
                    let isDescribed = value?["isDescribed"] as? String ?? ""
                    
                    self.addToImages(Images.init(url,caption,apiCaption,isDescribed))
                    
                }) { (error) in
                    print(error.localizedDescription)
                }
            }

        }
        
    }
    
    func addToImages(_ image:Images)
    {
        print("INFO ", image.apiCaption)
        self.imgs.append(image)
        
    }


}

