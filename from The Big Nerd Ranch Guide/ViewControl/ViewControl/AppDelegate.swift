//
//  AppDelegate.swift
//  ViewControl
//
//  Created by Carrl on 16/3/26.
//  Copyright © 2016年 monk-studio. All rights reserved.
//

import Cocoa
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

//    @IBOutlet weak var window: NSWindow!
    var window: NSWindow?
//    var mainWindowController: MainWindowController?


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
//        let mainWindowController = MainWindowController(windowNibName: "MainWindowController")
        // Put the window of the window controller on screen
//        mainWindowController.showWindow(self)
        // Set the property to point to the window controller
//        self.mainWindowController = mainWindowController
        let flowViewController = ImageViewController()
        flowViewController.title = "Flow"
        flowViewController.image = NSImage(named: NSImageNameFlowViewTemplate)
        let window = NSWindow(contentViewController: flowViewController)
        window.makeKeyAndOrderFront(self)
        self.window = window

    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

