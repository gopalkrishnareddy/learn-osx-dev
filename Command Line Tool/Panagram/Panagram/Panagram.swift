//
//  Panagram.swift
//  Panagram
//
//  Created by Carrl on 16/5/21.
//  Copyright © 2016年 monk-studio. All rights reserved.
//

import Foundation


// The class will handle the program logic
// with staticMode() representing non-interactive mode
class Panagram {
    
    let consoleIO = ConsoleIO()

    
    // 所有的命令第一个参数永远都是程序路径
    /*
     print(Process.arguement):
     
     ["/Users/admin/Library/Developer/Xcode/DerivedData/Panagram-gxvpqwygkdigkbcqkabbhozkryyx/Build/Products/Debug/Panagram", "-p"]
     */
    func staticMode() {
        //1
        let argCount = Process.argc
        //2
        let argument = Process.arguments[1]
        //3 取到"-"后面的值.
        let (option, value) = consoleIO.getOption(argument.substringFromIndex(argument.startIndex.advancedBy(1)))
        //4

        switch option {
        case .Anagram:
            if argCount != 4 {
                if argCount > 4 {
                    consoleIO.writeMessage("Too many arguments for option \(option.rawValue)", to: .Error)
                } else {
                    consoleIO.writeMessage("too few arguments for option \(option.rawValue)", to: .Error)
                }
                ConsoleIO.printUsage()
            } else {
                let first = Process.arguments[2]
                let second = Process.arguments[3]
                
                if first.isAnagramOfString(second) {
                    consoleIO.writeMessage("\(second) is an anagram of \(first)")
                } else {
                    consoleIO.writeMessage("\(second) is not an anagram of \(first)")
                }
            }
        case .Palindrome:
            if argCount != 3 {
                if argCount > 3 {
                    consoleIO.writeMessage("Too many arguments for option \(option.rawValue)", to: .Error)
                } else {
                    consoleIO.writeMessage("too few arguments for option \(option.rawValue)", to: .Error)
                }
            } else {
                let s = Process.arguments[2]
                let isPalindrome = s.isPalindrome()
                consoleIO.writeMessage("\(s) is \(isPalindrome ? "" : "not ")a palindrome")
            }
        case .Help:
            ConsoleIO.printUsage()
        case .Unknown, .Quit:
            consoleIO.writeMessage("Unkonwn option \(value)", to: .Error)
            ConsoleIO.printUsage()
        }

        
    }
    
    
    func interactiveMode() {
        //1
        consoleIO.writeMessage("Welcome to Panagram. This program checks if an input string is an anagram or palindrome.")
        //2
        var shouldQuit = false
        while !shouldQuit {
            //3
            consoleIO.writeMessage("Type 'a' to check for anagrams or 'p' for palindromes type 'q' to quit.")
            let (option, value) = consoleIO.getOption(consoleIO.getInput())
            
            switch option {
            case .Anagram:
                //4
                consoleIO.writeMessage("Type the first string:")
                let first = consoleIO.getInput()
                consoleIO.writeMessage("Type the second string:")
                let second = consoleIO.getInput()
                
                //5
                if first.isAnagramOfString(second) {
                    consoleIO.writeMessage("\(second) is an anagram of \(first)")
                } else {
                    consoleIO.writeMessage("\(second) is not an anagram of \(first)")
                }
            case .Palindrome:
                consoleIO.writeMessage("Type a word or sentence:")
                let s = consoleIO.getInput()
                let isPalindrome = s.isPalindrome()
                consoleIO.writeMessage("\(s) is \(isPalindrome ? "" : "not ")a palindrome")
            case .Quit:
                shouldQuit = true
            default:
                //6
                consoleIO.writeMessage("Unknown option \(value)", to: .Error)
            }
        }
    }

    
}
