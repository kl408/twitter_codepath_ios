//
//  LoginViewController.swift
//  Twitter
//
//  Created by Kristy Lau on 2/26/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //what to do once the page appears
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            //Run segue instead of asking to log in
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    
    @IBAction func onLoginButton(_ sender: Any) {
        //call the file and connect with request token in API
        let myUrl = "https://api.twitter.com/oauth/request_token"
        //if login is successful, go from login screen to home screen by performing segue
        //if login fails, print error
        TwitterAPICaller.client?.login(url: myUrl, success: {
            
            //If user has already logged in, keep them logged in (unless they decide to log out)
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            //userLoggedIn is already set to true, should allow user to move to home screen right away
            
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("Could not login.")
        })
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
