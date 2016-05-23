//
//  StringExtension.swift
//  Panagram
//
//  Created by Carrl on 16/5/21.
//  Copyright © 2016年 monk-studio. All rights reserved.
//

import Foundation


extension String{
    func isAnagramOfString(s: String) -> Bool {
        //1
        let lowerSelf = self.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "")
        let lowerOther = s.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "")
        //2
        return lowerSelf.characters.sort() == lowerOther.characters.sort()
    }
    
    func isPalindrome() -> Bool {
        //1
        let f = self.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "")
        //2
        let s = String(f.characters.reverse())
        //3
        return  f == s
    }
    
}