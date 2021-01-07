//
//  ContactController.swift
//  Telegramme
//
//  Created by Mohamed Thabith on 8/1/21.
//

import Foundation
import UIKit
import CoreData

class ContactController{
    
    func AddContact(newContact:Contact){
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistantContainer.viewContext
        let  entity = NSEntityDescription.entity(forEntityName: "CDContact", in: context)!
        
        let contact = NSManagedObject(entity:entity, insertInto: context)
        
        contact.setValue(newContact.firstName, forKey: "firstname")
        contact.setValue(newContact.lastName, forKey: "lastname")
        contact.setValue(newContact.mobileNo, forKey: "mobileno")
        
        do{
                   try appDelegate.saveContext()
               }catch let error as NSError{
                   print("Could not save")
               }
               
               
           }

           func retrieveAllContact() -> [Contact]
           {
               var contacts:[NSManagedObject] = []
               var aContact:[Contact] = []
               
               let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
               let context = appDelegate.persistantContainer.viewContext
               
               let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
               do{
                   contacts = try context.fetch(fetchRequest)
                   for a in contacts{
                       let firstname = a.value(forKey: "firstname") as? String
                       let lastname = a.value(forKey: "lastname") as? String
                       let mobileno = a.value(forKey: "mobileno") as? String
                       print("\(firstname!) \(lastname!), \(mobileno!)")
                       aContact = [Contact(firstname: firstname!, lastname: lastname!, mobileno: mobileno!)]
                       return aContact
                       
                   
                   }
                   
               } catch let error as NSError {
                   print("Could not fetch. \(error), \(error.userInfo)")
                   
               }
               appDelegate.saveContext()
               return aContact
           }
       }
       //    func updateContact(mobileno:String, newContact:Contact)
       //
       //
       //    }
       //
       //    func deleteContact(mobileno:String)
       //    {}
