//
//  ViewController.swift
//  UndoTestProject
//
//  Created by Ryan King on 8/7/15.
//  Copyright (c) 2015 Ryan King. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model:ColorModel = ColorModel()
    var document:ColorDocument!
    var currentlySelectedButton:UIButton? = nil
    let filePath:String = "tilefile"
    let documentDirectory:NSURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0] as! NSURL
    
    @IBOutlet weak var tileView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = documentDirectory.URLByAppendingPathComponent(filePath)
        
        if NSFileManager.defaultManager().fileExistsAtPath(url.path!) {
            document = ColorDocument(fileURL: url)
            document.model = model
            document.openWithCompletionHandler({(go:Bool) in
                self.updateView()
            })
        }
        else {
            document = ColorDocument(fileURL: url)
            // set document's properties
            document.model = model
            document.tile = model.tile
            document.saveToURL(url, forSaveOperation: UIDocumentSaveOperation.ForCreating, completionHandler: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateView() {
        tileView.backgroundColor = model.getTileColor()
        document.saveToURL(document.fileURL,forSaveOperation:UIDocumentSaveOperation.ForOverwriting,completionHandler:nil)
    }

    @IBAction func ColorButtonPushed(sender: AnyObject) {
        if let button = sender as? UIButton {
            model.changeColorOfTile(button.titleLabel!.textColor)
            currentlySelectedButton?.selected = false
            currentlySelectedButton = button
            button.selected = true
        }
        
        updateView()
    }
}

