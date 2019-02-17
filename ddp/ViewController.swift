//
//  ViewController.swift
//  ddp
//
//  Created by Zyad Galal on 2/16/19.
//  Copyright © 2019 Zyad Galal. All rights reserved.
//

import UIKit
import ObjectiveDDP

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func signinBtnClicked(_ sender: Any) {
        me?.logon(withEmail: email.text!, password: pass.text!, responseCallback: { (response, error) in
            if let err = error
            {
                print(err)
            }
            else
            {
                print(response)
            }
        })
    }
    
    @IBAction func goBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

