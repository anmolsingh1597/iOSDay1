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
        intialConnection.text = "Let get this started!!"
    }
    
    @IBAction func iTextField(_ sender: UITextField) {
        
    }
    

}

