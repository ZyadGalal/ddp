//
//  ViewController.swift
//  ddp
//
//  Created by Zyad Galal on 2/16/19.
//  Copyright © 2019 Zyad Galal. All rights reserved.
//

import UIKit
import ObjectiveDDP
import M13OrderedDictionary

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    //var lists:M13MutableOrderedDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //me?.addSubscription("posts.all")
        
    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("NSCoding not supported")
//    }
//    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!, meteor: MeteorClient!) {
//
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        // if(self != nil) {
//        me = meteor
//        //self.lists = self.meteor.collections["lists"] as M13MutableOrderedDictionary
//        //}
//    }
    
    @IBAction func postBtnClicked(_ sender: Any) {
        let dic = ["title":"zyad galal" , "content" : "bla bla bla bla"]
        me?.callMethodName("posts.methods.create", parameters: [dic], responseCallback: { (response, error) in
            if let err = error
            {
                print(err)
            }
            else
            {
                print(response!["token"])
            }
        })
    }
    @IBAction func signinBtnClicked(_ sender: Any) {
        me?.logon(withEmail: email.text!, password: pass.text!, responseCallback: { (response, error) in
            if let err = error
            {
                print(err.localizedDescription)
            }
            else
            {
                let responseResult : [AnyHashable : Any] = response!["result"] as! [AnyHashable : Any]
                print(responseResult["token"])
            }
        })
    }
    
    @IBAction func goBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

