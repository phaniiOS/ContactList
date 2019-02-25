//
//  ContactInfoViewController.swift
//  ContactList
//
//  Created by IMCS2 on 2/25/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import UIKit

class ContactInfoViewController: UIViewController {
    
//    var index: Int = 0
    @IBOutlet weak var FirstNameData: UILabel!
    
    @IBOutlet weak var LastNameData: UILabel!
    
    @IBOutlet weak var PhoneNumberData: UILabel!
    
    @IBOutlet weak var EmailData: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        FirstNameData.text = contacts[indexSelected].firstName
        PhoneNumberData.text = contacts[indexSelected].phoneNumber
        LastNameData.text = contacts[indexSelected].lastName
        if contacts[indexSelected].email != ""{
                EmailData.text = contacts[indexSelected].email
            
        }
        else{
            EmailData.text = "None"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
