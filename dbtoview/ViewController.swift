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
    
    var imgs:[Images] = []
  
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var textView: UITextView!
    
    var currentImageIndex: Int = 0
    
    let synthesizer = AVSpeechSynthesizer()
    
    var myUtterance = AVSpeechUtterance(string:"")
    
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
    
    //Adds images to the the image object array
    func addToImages(_ image:Images)
    {
        self.imgs.append(image)
        
        if(self.imgs.count == 10)
        {
            self.display()
        }
    }
    
    //This function will handle all of the view functionality as well as
    //having the machine read all of the information in the caption
    
    func display()
    {
        let image:Images = self.imgs[currentImageIndex]
        
        let url:URL = URL(string:image.url)!
        
        let data = try? Data(contentsOf: url)
        
        if let imageData = data {
            let viewImage = UIImage(data: imageData)
            imgView.image = viewImage!
        }
        else{
            print("Error getting the image. Please make sure the url is correct!")
        }
        
        self.textView.text = image.caption
        
        //speak the description to the user
        speakDescription(image.caption)
        
        //Resets image index
        if self.currentImageIndex < 9{
            self.currentImageIndex += 1
        }else{
            self.currentImageIndex = 0
        }
    }
    
    //this function reads the description text out to the user.
    
    func speakDescription(_ description:String)
    {
        self.myUtterance = AVSpeechUtterance(string:description)
        
        self.myUtterance.rate = 0.5
        
        self.synthesizer.speak(self.myUtterance)
    }
    
    
    @IBAction func nextImage(_ sender: UIButton) {
        self.display()
    }
    
}

