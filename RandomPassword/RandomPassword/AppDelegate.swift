//
//  AppDelegate.swift
//  RandomPassword
//
//  Created by 闻端 on 16/1/24.
//  Copyright © 2016年 monk-studio. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    var mainWindowController: MainWindowController!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        //create window 
        let mainWindowControlller = MainWindowController(windowNibName: "MainWindowController")
        
        
        self.mainWindowController = mainWindowControlller
        mainWindowControlller.showWindow(self)
        
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
        
        
        
    }


}

