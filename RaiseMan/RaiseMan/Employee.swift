//
//  Employee.swift
//  RaiseMan
//
//  Created by Carrl on 16/2/21.
//  Copyright © 2016年 monk-studio. All rights reserved.
//

import Foundation
import Cocoa

class Employee : NSObject {
    var name: String? = "New Employee"
    var raise: Float = 0.05
    
    func validateRaise(raiseNumberPointer:AutoreleasingUnsafeMutablePointer<NSNumber?>, error outError: NSErrorPointer) -> Bool{
        let raiseNumber = raiseNumberPointer.memory
        if(raiseNumber == nil){
            let domain = "UserInputValidationErrorDomain"
            let code = 0
            let userInfo = [NSLocalizedDescriptionKey:"An employee's raise must be a number."]
            outError.memory = NSError(domain: domain, code: code, userInfo: userInfo)
            return false
        }else{
            return true
        }
    }
    
    func test(){
        let undoManager = NSUndoManager()
        undoManager.prepareWithInvocationTarget(self)
        
            
            
    }
    
}


