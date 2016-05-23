//
//  ConsoleIO.swift
//  Panagram
//
//  Created by Carrl on 16/5/21.
//  Copyright © 2016年 monk-studio. All rights reserved.
//

import Foundation


// options -h
enum OptionType: String {
    case Palindrome = "p"
    case Anagram = "a"
    case Help = "h"
    case Quit = "q"
    case Unknown
    
    init(value: String) {
        switch value {
        case "a": self = .Anagram
        case "p": self = .Palindrome
        case "h": self = .Help
        case "q": self = .Quit
        default: self = .Unknown
        }
    }
}



enum OutputType {
    case Error
    case Standard
}



class ConsoleIO {
    func getInput() -> String {
        
        // 1. First, grab a handle to stdin.
        let keyboard = NSFileHandle.fileHandleWithStandardInput()
        
        // 2. Next, read any data on the stream.
        let inputData = keyboard.availableData
        
        // 3. Convert the data to a string.
        let strData = NSString(data: inputData, encoding: NSUTF8StringEncoding)!
        
        // 4. Finally, remove any newline characters and return the string.
        return strData.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
    }
    
    class func printUsage() {
        
        
        //Process 是 argc & argv 的 wrapper
        let executableName = (Process.arguments[0] as NSString).lastPathComponent
        
        print("usage:")
        print("\(executableName) -a string1 string2")
        print("or")
        print("\(executableName) -p string")
        print("or")
        print("\(executableName) -h to show usage information")
        print("Type \(executableName) without an option to enter interactive mode.")
    }
    
    func getOption(option: String) -> (option:OptionType, value: String) {
        return (OptionType(value: option), option)
        
    }
    
    func writeMessage(message: String, to: OutputType = .Standard) {
        
        // These are control characters that cause Terminal to change the color of the following string
        switch to {
        case .Standard:
            // to default
            print("\u{001B}[;m\(message)")
        case .Error:
            // in red
            fputs("\u{001B}[0;31m\(message)\n", stderr)
        }
    }


}