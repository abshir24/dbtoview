//
//  ViewController.swift
//  dbtoview
//
//  Created by Abshir Mohamed on 7/20/19.
//  Copyright © 2019 Abshir Mohamed. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Speech

class ViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var textView: UITextView!
    
    var displayInfo: DisplayInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.z
        self.displayInfo = DisplayInfo(textView,imgView)
        
    }
    
    @IBAction func nextImage(_ sender: UIButton) {
        self.displayInfo.display()
    }
    
}

