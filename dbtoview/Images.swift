//
//  Images.swift
//  ImageDescription
//
//  Created by Abshir Mohamed on 7/18/19.
//  Copyright © 2019 Rashad Jaraysa. All rights reserved.
//

import Foundation

class Images{
    var url: String;
    var caption: String;
    var isDescribed:Bool;
    var apiCaption:String;
    
    init(_ link: String,_ cap: String,_ apicap:String,_ isDes:String)
    {
        url = link
        
        caption = cap
        
        apiCaption = apicap
        
        isDescribed = isDes == "false" ? false : true
    }
        
    
}
