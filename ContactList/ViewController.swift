//
//  ViewController.swift
//  ContactList
//
//  Created by IMCS2 on 2/25/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import UIKit
import Contacts

var contacts = [ContactStruct]()
var indexSelected: Int = 0

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var contactStore = CNContactStore()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = contacts[indexPath.row].firstName
        cell.detailTextLabel?.text = contacts[indexPath.row].phoneNumber
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSelected = indexPath.row
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        contactStore.requestAccess(for: .contacts) {(sucess, error) in
                if sucess{
                    print("Sucess")
                }
            }
        fetchContacts()
    }
    
    func fetchContacts(){
        let key = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey, CNContactEmailAddressesKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: key)
        do{
            try contactStore.enumerateContacts(with: request){ (contact, pointer) in
                if (contact.emailAddresses.first?.value) != nil{
                contacts.append(ContactStruct(firstName: contact.givenName, lastName: contact.familyName, phoneNumber: (contact.phoneNumbers.first?.value.stringValue)!, email: contact.emailAddresses.first?.value as! String))
                }
            else{
                contacts.append(ContactStruct(firstName: contact.givenName, lastName: contact.familyName, phoneNumber: (contact.phoneNumbers.first?.value.stringValue)!, email: ""))
            }
            }
        }catch{
            print("error in accessing contacts")
        }
    }

}

