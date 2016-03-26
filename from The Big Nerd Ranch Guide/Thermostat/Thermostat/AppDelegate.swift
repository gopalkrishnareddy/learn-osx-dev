//
//  AppDelegate.swift
//  Thermostat
//
//  Created by Carrl on 16/2/21.
//  Copyright © 2016年 monk-studio. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    var mainWindowController: MainWindowController?
    
    
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Create a window controller with a XIB file of the same name
        let mainWindowController = MainWindowController()
        // Put the window of the window controller on screen
        mainWindowController.showWindow(self)
        // Set the property to point to the window controller
        self.mainWindowController = mainWindowController
        
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

