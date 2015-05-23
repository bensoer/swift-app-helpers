# swift-app-helpers
A Library of Helper Classes for common simple Swift App development purposes

#Library

#FormHelper.swift
A Simple class to help validate forms such as login, register or any page needing user form input

- validateEmail(email:String)->Bool
    - A simple email validator that returns true or false if the email passes validation
- validatePassword(password:String, confPassword:String?)->Bool
    - A simple password validator that returns true or false if the password passes validation. Will also check if a confirmation password is passed and use it in its validation

#AlertHelper.swift
A simple class for showing basic alerts needed as messages or general warnings

- showAlert(title:String, message:String)->Void
    - Shows a simpler alert with no event handler and a default "Ok" button in the middle to remove the alert. Compatable for both iOS8 and iOS7 systems
- showAlert(title:String, message:String, completionHandler: ((UIAlertAction!)->Void))->Void
    - Shows a simpler alert with a default "Ok" button in the middle to remove the alert. Selecting the "Ok" button will call the passed in completionHandler. Compatable for both iOS8 and iOS7 systems   

#KeyboardScrollViewManager.swift
A manager for the keyboard and its events in a scrollview setup environment. The class includes compensation for extra space needed when the keyboard appears and removing that space when the keybaord disappears. This does require though a specific setup of the scrollView and the ContentView layout with some constraints assumed already in place

- registerKeyboardListeners(observer: AnyObject)->Void
    - Call this function in the viewDidLoad() method of your page. This will create events for your page when the keyboard appears and disappears
- deRegisterKeyboardListeners()->Void
    - Call this function in the viewWillDisappear() method of your page. This will deregister your controller from recieving event calls when the page appears and disappears. This is required otherwise the app will crash on leaving the page the controller manages
- setKeyboardWillShowFunction(completionHandler: (()->Void))->Void
    - The passed in completionHandler will be called when the keyboard appears for any extra settings you would like to change or events of your own you would like to have triggered when this occurs
- setKeyboardWillHideFunction(completionHandler: (()->Void))->Void
    - The passed in completionHandler will be called when the keyboard disappears for any extra settings you would like to change or events of your own you would to have triggered when this occurs
