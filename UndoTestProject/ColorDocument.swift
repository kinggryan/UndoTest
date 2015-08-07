//
//  ColorDocument.swift
//  UndoTestProject
//
//  Created by Ryan King on 8/7/15.
//  Copyright (c) 2015 Ryan King. All rights reserved.
//

import UIKit

class ColorDocument: UIDocument {
    var tile:ColorTile!
    var model:ColorModel!
    
    override func contentsForType(typeName: String, error outError: NSErrorPointer) -> AnyObject? {
        // Create the actual file
        var savedata = NSKeyedArchiver.archivedDataWithRootObject(tile)
        return savedata
    }
    
    override func loadFromContents(contents: AnyObject, ofType typeName: String, error outError: NSErrorPointer) -> Bool {
        if let data = contents as? NSData {
            if let tempTile = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? ColorTile {
                tile = tempTile
                model.tile = tile
                return true
            }
        }
        
        return false
    }
}
