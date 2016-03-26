//
//  EventMonitor.swift
//  Quotes
//
//  Created by Carrl on 16/3/26.
//  Copyright © 2016年 monk-studio. All rights reserved.
//



import Cocoa

//用来监听全局(整个电脑发生)事件
public class EventMonitor {
    private var monitor: AnyObject?
    private let mask: NSEventMask
    private let handler: NSEvent? -> ()
    
    public init(mask: NSEventMask, handler: NSEvent? -> ()) {
        self.mask = mask
        self.handler = handler
    }
    
    deinit {
        stop()
    }
    
    public func start() {
        monitor = NSEvent.addGlobalMonitorForEventsMatchingMask(mask, handler: handler)
    }
    
    public func stop() {
        if monitor != nil {
            NSEvent.removeMonitor(monitor!)
            monitor = nil
        }
    }
}
