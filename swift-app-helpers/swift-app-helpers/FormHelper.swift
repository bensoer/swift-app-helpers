//
//  FormHelper.swift
//  swift-app-helpers
//
//  Created by Ben Soer on 2015-05-23.
//  Copyright (c) 2015 bensoer. All rights reserved.
//

import Foundation

class FormHelper {
    
    // @description validateEmail checks whether an email is valid based on a regex value and
    // as to whether it matches it or no
    // @param email String the email being validated
    // @return Bool the state of whether the email is valid or not
    static func validateEmail(email:String)->Bool{
        
        
        var emailRegex: String! = "^[A-Za-z0-9]*@[A-Za-z0-9][A-Za-z0-9]*.(ca|com|org|net|co)$"
        
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluateWithObject(email);
        
    }
    
    // @description validatePassword validates whether a password and its optional confirmation
    // password are valid. Optionaly additional validation can also be passed in
    // @param password String the password being validated
    // @param confPassword String? the confirmation password being validated. This may or may
    // not have a value, default is nil
    // @param additionalValidation ((password:String, confPassword:String?)->Bool)? an optional
    // completion handler for the client to add additional validation to the process. The 
    // completion handler is passed the password and optional confirmation password that was 
    // passed into this function. If the completion handler is nil it will be ignored
    // @return Bool the state of whether the email is valid or not
    static func validatePassword(password:String, confPassword:String?, additionalValidation: ((password:String, confPassword:String?)->Bool)?)->Bool{
        
        if(password.isEmpty){
            return false;
        }
        
        if(confPassword != nil){
            
            if(confPassword!.isEmpty){
                return false
            }
            
            if(password != confPassword!){
                return false
            }
        }
        
        if(additionalValidation != nil){
            return additionalValidation!(password: password, confPassword: confPassword)
        }else{
            return true;
        }
    }
}