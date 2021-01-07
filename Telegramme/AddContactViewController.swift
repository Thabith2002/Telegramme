//
//  AddContactViewController.swift
//  Telegramme
//
//  Created by Mohamed Thabith on 12/11/20.
//

import Foundation
import UIKit

class AddContactViewController : UIViewController {
    
    @IBOutlet weak var firstNameFld: UITextField!
    
    @IBOutlet weak var lastNameFld: UITextField!
    
    @IBOutlet weak var mobileFld: UITextField!
    
    var contactController = ContactController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        firstNameFld.text = ""
        lastNameFld.text = ""
        mobileFld.text = ""
    }
  
    @IBAction func createBtn(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let contact = Contact(firstname: firstNameFld.text!, lastname: lastNameFld.text!, mobileno: mobileFld.text!)
         
         //appDelegate.contactList.append(contact)
        contactController.AddContact(newContact: contact)
        
        print(String(appDelegate.contactList.count),"\nContact Added Successfully\n")
    }
    

    
}
