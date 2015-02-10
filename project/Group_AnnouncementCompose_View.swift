//
//  AnnouncementComposeView.swift
//  project
//
//  Created by Justin Chee on 2015-01-23.
//  Copyright (c) 2015 ctrlaltbelieve2. All rights reserved.
//

import UIKit
import MessageUI

class Group_AnnouncementCompose_View: UIViewController, MFMailComposeViewControllerDelegate
{

    @IBOutlet weak var textViewCompose: UITextView!;
    @IBOutlet weak var btnErase: UIButton!;
    @IBOutlet weak var btnSend: UIButton!;
	
	var myMail: MFMailComposeViewController!;
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
		
        self.textViewCompose.layer.cornerRadius = 3;
        self.btnErase.layer.cornerRadius = 3;
        self.btnSend.layer.cornerRadius = 3;
        
    }
    
	@IBAction func sendEmail(sender: AnyObject) {
		textViewCompose.text = "email";
		
		if(MFMailComposeViewController.canSendMail()){
			myMail = MFMailComposeViewController()
			
			//myMail.mailComposeDelegate
			myMail.mailComposeDelegate = self
			
			// set the subject
			myMail.setSubject("My report")
			
			//To recipients
			var toRecipients = ["lipeilin@gatech.edu"]
			myMail.setToRecipients(toRecipients)
			
			//CC recipients
			var ccRecipients = ["tzhang85@gatech.edu"]
			myMail.setCcRecipients(ccRecipients)
			
			//CC recipients
			var bccRecipients = ["tzhang85@gatech.edu"]
			myMail.setBccRecipients(ccRecipients)
			
			//Add some text to the message body
			var sentfrom = "Email sent from my app"
			myMail.setMessageBody(sentfrom, isHTML: true)
			
			
			//Display the view controller
			self.presentViewController(myMail, animated: true, completion: nil)
		}
		else{
			var alert = UIAlertController(title: "Alert", message: "Your device cannot send emails", preferredStyle: UIAlertControllerStyle.Alert)
			alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
			self.presentViewController(alert, animated: true, completion: nil)
			
			
		}
	}
	
	func mailComposeController(controller: MFMailComposeViewController!,
		didFinishWithResult result: MFMailComposeResult,
		error: NSError!){
			
			switch(result.value){
			case MFMailComposeResultSent.value:
				println("Email sent")
				
			default:
				println("Whoops")
			}
			
			self.dismissViewControllerAnimated(true, completion: nil)
			
	}
	
    @IBAction func eraseCompose(sender: AnyObject)
    {
        textViewCompose.text = "";
    }
}
