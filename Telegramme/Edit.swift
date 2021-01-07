//
//  Edit.swift
//  Telegramme
//
//  Created by Mohamed Thabith on 8/1/21.
//

import Foundation
import UIKit

class Edit : UIViewController {
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    @IBOutlet weak var editFirstName: UITextField!
    @IBOutlet weak var editLastName: UITextField!
    @IBOutlet weak var editNumber: UITextField!
    
    
    
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editFirstName.text = contact?.firstName
        editLastName.text = contact?.lastName
        editNumber.text = contact?.mobileNo
    }
    
    
    @IBAction func updateBtn(_ sender: Any) {
        if editFirstName.text != "" && editLastName.text != "" && editNumber.text != "" {
            
            contact?.firstName = editFirstName.text!
            contact?.lastName = editLastName.text!
            contact?.mobileNo = editNumber.text!
            self.navigationController?.popViewController(animated: true)
        }
        
        else {
            print("empty values")
        }
    }
    
}
