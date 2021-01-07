//
//  ShowContactViewController.swift
//  Telegramme
//
//  Created by Mohamed Thabith on 24/11/20.
//

import Foundation
import UIKit

class ShowContactViewController : UITableViewController {
    
    
    var contactController = ContactController()
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.reloadData()
        self.navigationItem.rightBarButtonItem = self.editButtonItem

    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.contactList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        
        let contact = appDelegate.contactList[indexPath.row]
        cell.textLabel!.text = "\(contact.firstName) \(contact.lastName)"
        cell.detailTextLabel!.text = "\(contact.mobileNo)"
        
        return cell
    }
    
    // when a table row is selected, the following delegate is called
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    let contact = appDelegate.contactList[indexPath.row]

    let alert = UIAlertController(title: "Contact selected",
                                  message: "You selected \(contact.firstName) \(contact.lastName)",
    preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,
    handler: { (alert: UIAlertAction!) in print("An alert was tapped!")}))
        alert.addAction(UIAlertAction(title: "Edit", style: UIAlertAction.Style.default,
    handler: { (alert: UIAlertAction!) in print("Edit was tapped!")}))
    self.present(alert, animated: true, completion: nil)
        
        
        
    }
    

    //Exercise 2
    override func tableView(_ tableView: UITableView, canEditRowAt
    indexPath: IndexPath) -> Bool {
            return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle:
    UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == UITableViewCell.EditingStyle.delete {
    appDelegate.contactList.remove(at: indexPath.row)
    
    tableView.deleteRows(at: [indexPath as IndexPath],
    with: UITableView.RowAnimation.fade)
    }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let edit = segue.destination as? Edit,
              let index = tableView.indexPathForSelectedRow?.row
        else{
            return
        }
        edit.contact = appDelegate.contactList[index]
    }
        
        
        
}
