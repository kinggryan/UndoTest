//
//  ColorTile.swift
//  UndoTestProject
//
//  Created by Ryan King on 8/7/15.
//  Copyright (c) 2015 Ryan King. All rights reserved.
//

import UIKit

class ColorTile: NSObject, NSCoding {
    var color:UIColor = UIColor.blackColor()
    
    convenience required init(coder aDecoder: NSCoder){

        self.init()
    
        color = aDecoder.decodeObjectForKey("color") as! UIColor
    }
    
    func encodeWithCoder(encoder: NSCoder)
    {
        encoder.encodeObject(color, forKey:("color"))
    }
}
