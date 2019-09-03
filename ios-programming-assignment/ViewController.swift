//
//  ViewController.swift
//  ios-programming-assignment
//
//  Created by Ricky Gomez on 9/2/19.
//  Copyright © 2019 Ricky Gomez. All rights reserved.
//

import UIKit
import FirebaseUI

class ViewController: UIViewController {
    @IBOutlet weak var roundedCornerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundedCornerButton.layer.cornerRadius = 4
        // Do any additional setup after loading the view.
    }


    @IBAction func loginTapped(_ sender: UIButton) {
        //Get the default auth UI object
        let authUI = FUIAuth.defaultAuthUI()
        guard authUI != nil else {
            return
        }
        
        // Set ourselves as the delegate
        authUI?.delegate = self
        authUI?.providers = [FUIEmailAuth()]
        
        // Get a reference to the auth UI view controller
        let authViewController = authUI!.authViewController()
        
        // Show it
        present(authViewController, animated: true, completion: nil)
        
    }
}

extension ViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        // Check if there was an error
        if error != nil {
            // Log the error
            return
        }
        //authDataResult?.user.uid
        
        performSegue(withIdentifier: "goHome", sender: self)
    }
}
