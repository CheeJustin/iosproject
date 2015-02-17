//
//  LoginVC.swift
//  Login
//
//  Created by ctrlaltbelieve2 on 2015-01-11.
//  Copyright (c) 2015 ctrlaltbelieve2. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {
	
	@IBOutlet weak var txtUsername: UITextField!
	@IBOutlet weak var txtPassword: UITextField!
	@IBOutlet weak var invalidLogin: UILabel!
	
	var loggedIn = false
    var frameView: UIView!

	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let background = CAGradientLayer().grayColor()
		background.frame = self.view.bounds
		self.view.layer.insertSublayer(background, atIndex: 0)
        
        self.txtUsername.delegate = self;
        self.txtPassword.delegate = self;
        
        //Keyboard textfied focus
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
        // End keyboard stuff
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// Passes logged in flag and username to Home screen
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) 
    {
		if(segue.identifier == "goto_home")
		{
			var homeVC = segue.destinationViewController as ViewController
			homeVC.loggedIn = loggedIn
			homeVC.username = txtUsername.text
		}
	}
    
    //Dismiss keyboard
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool 
    {
        self.view.endEditing(true);
        return false;
    }
    
    //Move UITextview up on keyboard reveal
    func keyboardWillShow(sender: NSNotification) 
    {
        self.view.frame.origin.y -= 150
        println("Will Show")
    }
    func keyboardWillHide(sender: NSNotification) 
    {
        self.view.frame.origin.y += 150
        println("Will Hide")
    }
    //End move UITextview up on keyboard reveal
    
    
	@IBAction func signinTapped(sender: UIButton) 
    {
		
		// test variables, will eventually be pulled from db
        var userTest = "A00812345"
        var pwTest = "test"
		var user = txtUsername.text
		var pw = txtPassword.text
		
		// basic authentication
		if txtUsername.text == userTest && txtPassword.text == pwTest
		{
			loggedIn = true // flags user as logged in
			
			// Triggers segue to home screen
			self.performSegueWithIdentifier("goto_home", sender: self)
		}
		else
		{
			// Displays invalid login message
			// Next Step: Make this animate to fade in/out
			invalidLogin.text = "Invalid Student ID or Password."
			
		}
		
		
	}
	
	
	/*
	// MARK: - Navigation
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
	// Get the new view controller using segue.destinationViewController.
	// Pass the selected object to the new view controller.
	}
	*/
	
}
