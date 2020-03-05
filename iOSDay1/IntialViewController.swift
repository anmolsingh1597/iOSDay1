//
//  ViewController.swift
//  iOSDay1
//
//  Created by Anmol singh on 2020-02-28.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit
import Firebase

class IntialViewController: UIViewController {
    
    var ref = Database.database().reference()



    @IBOutlet weak var intialConnection: UILabel!
    
    @IBOutlet weak var iText: UITextField!
    
    @IBOutlet weak var iPassword: UITextField!
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        intialConnection.text = "Welcome"
       print(intialConnection.text!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    
    @IBAction func iButton(_ sender: UIButton) {
        
// assign tag to button in button attributes inspector
          if sender.tag == 0 //Show alert- alert in front
          {
          let alertController = UIAlertController(title: "Error", message:
            "Hello, world!", preferredStyle: .alert)
          alertController.addAction(UIAlertAction(title: "default", style: .default))
          alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
          // alertController.addAction(UIAlertAction(title: "default2", style: .default))
          // alertController.addAction(UIAlertAction(title: "Destructive1", style: .destructive))
           
            alertController.addAction(UIAlertAction(title: "Destructive", style: .destructive, handler: { (sender) in
              print("Click Destructive")
            }))
           
          self.present(alertController, animated: true, completion: nil)
          }
// assign tag to button in button attributes inspector
          if sender.tag == 1 //show action- pop up from bottom
          {
            let alertController = UIAlertController(title: "Action", message:
              "Tasks", preferredStyle: .actionSheet)
            alertController.addAction(UIAlertAction(title: "Add in", style: .default, handler: {(sender) in
// Data Insertion in Firebase
                let user = self.iText.text
                let password = self.iPassword.text
// Generation of AutoKey in Firebase using "childByAutoId()"
               guard let key = self.ref.child("Users").childByAutoId().key else { return } // value assign in firebase through alert in "Sign in Key"
                       let insert = ["userName": user,
                                   "password": password]
                
                 let refer = self.ref.child("Users")
                refer.observeSingleEvent(of: .value, with: { (snapshot) in
                    if let userDict = snapshot.value as? [String:[String:String]]{
                        if userDict.values.contains(insert as! [String: String]){
                            print("User exist")
                        }else{
                              let childUpdates = ["/Users/\(key)": insert]
                             self.ref.updateChildValues(childUpdates)
                        }
                    }
                })
                      // let childUpdates = ["/Users/\(key)": insert]
// values inserted successfully
               // self.ref.updateChildValues(childUpdates)
            }))
            alertController.addAction(UIAlertAction(title: "Sign in", style: .destructive, handler: {(sender) in
// Retrieveing data from Firebase
                let refer = self.ref.child("Users")
// Taking snapshot of saved data in Firebase
                refer.observeSingleEvent(of: .value, with: { (snapshot) in
                    if let userDict = snapshot.value as? [String:[String:String]] {
                        print(userDict.values)
// Matching the user inputted values with already stored ones(in Firebase)
                        let userData = ["userName": self.iText.text, "password": self.iPassword.text]
// if mapped - then show alert "Successfully Logged In!"
                        if userDict.values.contains(userData as! [String : String]){
                            print("It worked")
                            let alertControll = UIAlertController(title: "Successfully Logged In!", message: "Logged In", preferredStyle: .alert)
                             alertControll.addAction(UIAlertAction(title: "Ok", style: .default))
                             self.present(alertControll, animated: true, completion: nil)
// if unmatched- then show alert "Log In Failed"
                        }else{
                            print("Still not working")
                            let alertControll = UIAlertController(title: "Log In Failed", message: "Invalid User-name and Password ", preferredStyle: .alert)
                            alertControll.addAction(UIAlertAction(title: "Ok", style: .default))
                            self.present(alertControll, animated: true, completion: nil)
                        }
                    }
                     })
            }))
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
           /*alertController.addAction(UIAlertAction(title: "Destructive2", style: .destructive, handler: { (sender) in
                print("Click Destructive")}))*/
             self.present(alertController, animated: true, completion: nil)
             }
    
        
        
    //   intialConnection.text = "Let get this started!!"
        // intialConnection.text = iText.text ?? ""
//        if iPassword.text == "anmolSingh" && iText.text == "Anmol"{
//
//                let alertController = UIAlertController(title: "Login", message:
//                    "Successful", preferredStyle: .alert)
//                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
//
//                self.present(alertController, animated: true, completion: nil)
//
//        }else{
//            intialConnection.text = "Login Failed"
//        }
        
//update in database as dictionary
        
    /*  let user = iText.text
    let password = iPassword.text
    guard let key = ref.child("Users").childByAutoId().key else { return }
    let insert = ["userName": user,
                    "password": password]
        let childUpdates = ["/Users/\(key)": insert]
        ref.updateChildValues(childUpdates)
*/
        //read attempt from database
 /*       let refe = ref.child("Users").child("userName")

        refe.observeSingleEvent(of: .childAdded, with: { (snapshot) in
             if let userDict = snapshot.value as? [String:Any] {
                  //Do not cast print it directly may be score is Int not string
                  debugPrint(userDict["password"]!)
             }
        })*/
    }
    
    @IBAction func iTextField(_ sender: UITextField) {
         intialConnection.text = iText.text ?? ""
//        let user = intialConnection.text
//        self.ref.child("users").setValue(["username": user ])
    }
    

}

