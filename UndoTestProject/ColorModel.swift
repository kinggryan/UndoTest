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
    var undoManager:NSUndoManager!
    
    func changeColorOfTile(color:UIColor) {
        let oldColor = tile.color
        tile.color = color
        
        undoManager.setActionName("ColorChanged")
        undoManager.registerUndoWithTarget(self, selector: "changeColorOfTile:", object: oldColor)
    }
    
    func getTileColor() -> UIColor {
        return tile.color
    }
}
