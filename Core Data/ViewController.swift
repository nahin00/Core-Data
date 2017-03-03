//
//  ViewController.swift
//  Core Data
//
//  Created by Nahin Ahmed on 3/3/17.
//  Copyright © 2017 Nahin Ahmed. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var timeTF: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func contactSubmitBtnTapped(_ sender: UIButton) {
        
        let contactHistory = ContactHistory(context: context)
        contactHistory.name = nameTF.text
        contactHistory.time = timeTF.text
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        let _ = navigationController?.popViewController(animated: true)
        
        print("saved successfull")
        
    }


}

