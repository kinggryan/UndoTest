//
//  ColorModel.swift
//  UndoTestProject
//
//  Created by Ryan King on 8/7/15.
//  Copyright (c) 2015 Ryan King. All rights reserved.
//

import UIKit

class ColorModel: NSObject {
    var tile:ColorTile = ColorTile()
    
    func changeColorOfTile(color:UIColor) {
        tile.color = color
    }
    
    func getTileColor() -> UIColor {
        return tile.color
    }
}
