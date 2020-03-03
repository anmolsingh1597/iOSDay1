//
//  ViewController.swift
//  iOSDay1
//
//  Created by Anmol singh on 2020-02-28.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit

class IntialViewController: UIViewController {

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
        

          if sender.tag == 0 //Show alert
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
           
          if sender.tag == 1 //show action
          {
            let alertController = UIAlertController(title: "Error", message:
              "Hello, world!", preferredStyle: .actionSheet)
             alertController.addAction(UIAlertAction(title: "default", style: .default))
             alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            // alertController.addAction(UIAlertAction(title: "default2", style: .default))
             alertController.addAction(UIAlertAction(title: "Destructive1", style: .destructive))
            //alertController.addAction(UIAlertAction(title: "Destructive2", style: .destructive, handler: { (sender) in
           // print("Click Destructive")
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
    }
    
    @IBAction func iTextField(_ sender: UITextField) {
         intialConnection.text = iText.text ?? ""
    }
    

}

