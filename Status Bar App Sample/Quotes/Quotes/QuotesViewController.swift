//
//  QuotesViewController.swift
//  Quotes
//
//  Created by Carrl on 16/3/26.
//  Copyright © 2016年 monk-studio. All rights reserved.
//

import Cocoa

class QuotesViewController: NSViewController {
    
    let quote = Quote.all
    var currentQuoteIndex: Int = 0 {
        didSet {
            updateQuote()
        }
    }
    func updateQuote(){
        self.text.stringValue = self.quote[currentQuoteIndex].text + " -" + self.quote[currentQuoteIndex].author
    }
    
    @IBOutlet weak var text: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateQuote()
        // Do view setup here.
    }
    
    @IBAction func didPressLast(sender: AnyObject) {
        self.currentQuoteIndex = (self.currentQuoteIndex - 1) >= 0 ? (self.currentQuoteIndex - 1) : 0
    }
    @IBAction func didPressNext(sender: AnyObject) {
        self.currentQuoteIndex = (self.currentQuoteIndex + 1) <= (self.quote.count - 1) ? (self.currentQuoteIndex + 1) : (self.quote.count - 1)

    }
    @IBAction func didPressQuit(sender: AnyObject) {
        NSApplication.sharedApplication().terminate(sender)
    }
}
