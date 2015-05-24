//
//  AlertHelper.swift
//  swift-app-helpers
//
//  Created by Ben Soer on 2015-05-23.
//  Copyright (c) 2015 bensoer. All rights reserved.
//

import Foundation
import UIKit

public class AlertHelper: UIViewController {
    
    // @description showAlert shows an alert to the screen with default basic settings. It is
    // intended to be used as a general prompt of either an error or of a task completing. The prompt
    // appears with a default "Ok" button that when selected closes the prompt
    // @param title String the title that will be on the prompt
    // @param message String the message that will be on the prompt
    // @param buttonText String the text placed on the button pressed to remove the prompt. By default
    // this value is set to "Ok". To use the default value don't pass this parameter
    static func showAlert(title:String, message:String, buttonText:String = "Ok"){
        //for iOS 7 and 8 compatability
        if(respondsToSelector("UIAlertController")){
            var alert = UIAlertController(title:title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: buttonText, style: .Default, handler: { (action: UIAlertAction!) in
                return;
            }))
            
            
        }else{
         
            var alert = UIAlertView(title:title, message: message, delegate: nil, cancelButtonTitle: "Ok");
            alert.show();
            
            
        }
    }
    
    // @description showAlert shows an alert to the screen with the passed in title, text and button
    // text. Upon selecting the button the ios7Delegate or ios8Delegates are called to carry out
    // eventHandlers for the given events
    // @param title String the title that will be on the prompt
    // @param message String the message that will be on the prompt
    // @param ios7Delegate UIAlertViewDelegate? the event handler for when the button on the prompt is
    // pressed on iOS 7 devices. To have no events occur, pass nil
    // @param buttonText String the text placed on the button when pressed. By default the value is 
    // set to "Ok". To use the default value don't pass this parameter
    // @param ios8Delegate ((action:UIAlertAction!)->Void!) the event handler for when the button is
    // pressed on iOS 8 devices. To have no events occur, pass an event handler which returns immediatly
    static func showAlert(title:String, message:String, ios7Delegate: UIAlertViewDelegate?, buttonText:String = "Ok", ios8Delegate:((action:UIAlertAction!)->Void)!){
        
        //for iOS 7 and 8 compatability
        if(respondsToSelector("UIAlertController")){
            var alert = UIAlertController(title:title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: buttonText, style: .Default, handler: ios8Delegate));
            
            
            
        }else{
            var alert = UIAlertView(title:title, message: message, delegate: ios7Delegate, cancelButtonTitle: buttonText);
            alert.show();
            
            
        }
    }
    
    
}