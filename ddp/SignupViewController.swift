//
//  SignupViewController.swift
//  ddp
//
//  Created by Zyad Galal on 2/16/19.
//  Copyright © 2019 Zyad Galal. All rights reserved.
//

import UIKit
import ObjectiveDDP

class SignupViewController: UIViewController {

    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        me?.callMethodName("posts.methods.create", parameters: ["Zyad Galal" , "first post"], responseCallback: { (response, error) in
            if let err = error
            {
                print(err)
            }
            else
            {
                print(response)
            }
        })
        // Do any additional setup after loading the view.
    }

    @IBAction func signup(_ sender: Any) {
        me?.signup(withEmail: email.text!, password: pass.text!, fullname: "zozz", responseCallback: { (response, error) in
            if let erro = error
            {
                print(error)
            }
            else
            {
                print(response)
            }
        })
    }
    
}
