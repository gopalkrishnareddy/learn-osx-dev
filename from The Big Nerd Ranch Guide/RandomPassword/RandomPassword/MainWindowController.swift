//
//  MainWindowController.swift
//  RandomPassword
//
//  Created by 闻端 on 16/1/24.
//  Copyright © 2016年 monk-studio. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    @IBOutlet weak var textField: NSTextField!
    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    @IBAction func generatePassword(sender: AnyObject) {
        // Tell the text field what to display
        textField.stringValue = "button clicked"
        
        
        
        let length = 8
        let password = generateRandomString(length)
        textField.stringValue = password
        
    }
    
}
