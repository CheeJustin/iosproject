//
//  RecoverPasswordVC.swift
//  Login
//
//  Created by ctrlaltbelieve2 on 2015-01-19.
//  Copyright (c) 2015 ctrlaltbelieve2. All rights reserved.
//

import UIKit

class RecoverPasswordVC: UIViewController {

	@IBOutlet weak var webView: UIWebView!
	
	let url = "https://bss.bcit.ca/owa_prod/twbkwbis.P_ForgotPwdPage"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let requestURL = NSURL(string:url)
		let request = NSURLRequest(URL: requestURL!)
		webView.loadRequest(request)
		
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
