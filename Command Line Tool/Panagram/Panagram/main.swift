//
//  main.swift
//  Panagram
//
//  Created by Carrl on 16/5/21.
//  Copyright © 2016年 monk-studio. All rights reserved.
//

// Following Tutorial From : https://www.raywenderlich.com/128039/command-line-programs-os-x-tutorial




import Foundation

// Swift doesn’t have a main function; instead, it has a main file.



let panagram = Panagram()

if Process.argc < 2 {
    panagram.interactiveMode()
} else {
    panagram.staticMode()
}
