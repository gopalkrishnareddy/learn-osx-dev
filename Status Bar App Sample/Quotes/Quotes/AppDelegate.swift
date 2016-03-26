//
//  AppDelegate.swift
//  Quotes
//
//  Created by Carrl on 16/3/26.
//  Copyright © 2016年 monk-studio. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-2)

    let popover = NSPopover()
    
    //时间监听
    var eventMonitor: EventMonitor?

    
    
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        if let button = statusItem.button {
            button.image = NSImage(named: "StatusBarButtonImage")
//            button.action = Selector("printQuote:")
            button.action = Selector("togglePopover:")

        }
        
        //MARK: Event Monitoring 
        //获知鼠标左击或者右击的时候, 触发close popover
        self.eventMonitor = EventMonitor(mask: [.LeftMouseDownMask,.RightMouseDownMask]) { [unowned self] event in
            if self.popover.shown {
                self.closePopover(event)
            }
        }
        eventMonitor?.start()

        
//        let menu = NSMenu()
//        //MARK: 添加选项
//        menu.addItem(NSMenuItem(title: "Print Quote", action: Selector("printQuote:"), keyEquivalent: "P"))
//        //seperate.~
//        menu.addItem(NSMenuItem.separatorItem())
//        //normal.
//        menu.addItem(NSMenuItem(title: "Quit Quotes", action: Selector("terminate:"), keyEquivalent: "q"))
//        // keyEquivalent代表着相对应的快捷键呢
//        statusItem.menu = menu

        //添加popover
        popover.contentViewController = QuotesViewController(nibName: "QuotesViewController", bundle: nil)
        
        
        
    }
    
    //MARK: popover相关
    func showPopover(sender: AnyObject?) {
        if let button = statusItem.button {
            popover.showRelativeToRect(button.bounds, ofView: button, preferredEdge: NSRectEdge.MinY)
        }
        self.eventMonitor?.start()
    }
    
    func closePopover(sender: AnyObject?) {
        popover.performClose(sender)
        self.eventMonitor?.stop()
    }
    
    func togglePopover(sender: AnyObject?) {
        if popover.shown {
            closePopover(sender)
        } else {
            showPopover(sender)
        }
    }

    
    

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    
    func printQuote(sender: AnyObject) {
        let quoteText = "Never put off until tomorrow what you can do the day after tomorrow."
        let quoteAuthor = "Mark Twain"
        
        print("\(quoteText) — \(quoteAuthor)")
    }

}

