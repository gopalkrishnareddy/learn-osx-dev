//
//  MainWindowController.swift
//  RGBWell
//
//  Created by 闻端 on 16/2/1.
//  Copyright © 2016年 monk-studio. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController{
    
    
    var r = 0.0 as CGFloat
    var g = 0.0 as CGFloat
    var b = 0.0 as CGFloat
    let a = 1.0 as CGFloat
    
    @IBOutlet weak var colorWell: NSColorWell!
    
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        
    }
    
    @IBAction func didSlideR(sender: NSSlider) {
        print(sender.doubleValue)
        self.r = CGFloat(sender.doubleValue)
        self.refreshColor()
        
    }
    
    @IBAction func didSlideG(sender: NSSlider) {
        self.g = CGFloat(sender.doubleValue)
        self.refreshColor()

    }
    
    
    @IBAction func didSlideB(sender: NSSlider) {
        self.b = CGFloat(sender.doubleValue)
        self.refreshColor()
    }
    
    
    func refreshColor(){
        
        self.colorWell.color = NSColor(calibratedRed: self.r, green: self.g, blue: self.b, alpha: self.a)
        
    }
    
}



