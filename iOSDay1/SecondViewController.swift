//
//  SecondViewController.swift
//  iOSDay1
//
//  Created by Anmol singh on 2020-03-02.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imgLion: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       // imgLion.image = UIImage(named: "gorilla")
        imgLion.image = #imageLiteral(resourceName: "ice cream.png")
        imgLion.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        
        // Do any additional setup after loading the view.
    }
    @IBAction func segImageChange(_ sender: UISegmentedControl) {
        displayImage(index: sender.selectedSegmentIndex)
    }
    
    @IBAction func slideColor(_ sender: UISlider) {
        //print(Int(sender.value))
        let n = Int(sender.value)
        displayImage(index: n)
    }
    
    private func displayImage(index: Int){
        var imageName = String()
            switch index{
            case 0:
                imageName = "lion"
            case 1:
                imageName = "gorilla"
            case 2:
                imageName = "elephant"
            case 3:
                imageName = "ice cream"
            case 4:
                imageName = "home"
            default:
                print("No image selected")
            }
            self.imgLion.image = UIImage(named: imageName)
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
