//
//  MainWindowController.swift
//  Thermostat
//
//  Created by Carrl on 16/2/21.
//  Copyright © 2016年 monk-studio. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    
    dynamic var temperature = 68
    dynamic var isOn = true
    
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        let textfield = NSTextField(frame: CGRectMake(0,0,0,0))
        
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    override var windowNibName: String {
        return "MainWindowController"
    }
    
    @IBAction func makeWarmer(sender: NSButton) {
//        let newTemperature = temperature + 1
//        setValue(newTemperature, forKey:"temperature")
        
//        willChangeValueForKey("temperature")
        temperature++
//        didChangeValueForKey("temperature")
    }
    
    
    @IBAction func makeCooler(sender: NSButton) {
//        let newTemperature = temperature - 1
//        setValue(newTemperature, forKey:"temperature")
        
//        willChangeValueForKey("temperature")
        temperature--
//        didChangeValueForKey("temperature")
    }
    
    
}
