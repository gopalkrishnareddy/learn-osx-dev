
//
//  MainWindowController.swift
//  SpeakLine
//
//  Created by 闻端 on 16/2/1.
//  Copyright © 2016年 monk-studio. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    
    @IBOutlet weak var buttonStop: NSButton!
    @IBOutlet weak var buttonSpeak: NSButton!
    @IBOutlet weak var textField: NSTextField!
    
    let speechSynth = NSSpeechSynthesizer()
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        self.speechSynth.delegate = self
        
        
    }
    @IBAction func speakIt(sender: NSButton) {
        let string = self.textField.stringValue
        if string.isEmpty {
            print("string from \(textField) is empty")
        } else {
            print("string is \"\(textField.stringValue)\"")
            self.speechSynth.startSpeakingString(string)
        }
        
    }
    
    @IBAction func stopIt(sender: NSButton) {
        print("stop button clicked")
        self.speechSynth.stopSpeaking()
    }
}


extension MainWindowController:NSSpeechSynthesizerDelegate{
    
}