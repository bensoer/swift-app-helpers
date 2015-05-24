//
//  KeyboardScrollViewManager.swift
//  swift-app-helpers
//
//  Created by Ben Soer on 2015-05-23.
//  Copyright (c) 2015 bensoer. All rights reserved.
//

import Foundation
import UIKit

public class KeyboardScrollViewManager {
    
    private var observer: AnyObject;
    
    private var keyboardWillShowFunction:(()->Void)?
    private var keyboardWillHideFunction:(()->Void)?
    
    public init(observer:AnyObject){
        self.observer = observer;
    }
    
    public func registerKeyboardListeners(){
        
        NSNotificationCenter.defaultCenter().addObserver(observer, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(observer, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
        
    }
    
    public func deregisterKeyboardListeners(){
        NSNotificationCenter.defaultCenter().removeObserver(observer);
    }
    
    public func setKeyboardWillShowFunction(completionHandler:(()->Void)){
        keyboardWillShowFunction = completionHandler;
    }
    
    public func setKeyboardWillHideFunction(completionHandler:(()->Void)){
        keyboardWillHideFunction = completionHandler;
    }
    
    func keyboardWillShow(notification:NSNotification){
        keyboardWillShowFunction!();
    }
    
    func keyboardWillHide(notification:NSNotification){
        keyboardWillHideFunction!();
    }
}