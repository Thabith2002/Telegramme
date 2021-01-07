//
//  ViewController.swift
//  Telegramme
//
//  Created by Mohamed Thabith on 12/11/20.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var usrNameFld: UITextField!
    
    
    @IBOutlet weak var pwdFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClick(_ sender: Any) {
        
        if true{
            let storyboard = UIStoryboard(name: "Content", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "Content") as UIViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    
}

