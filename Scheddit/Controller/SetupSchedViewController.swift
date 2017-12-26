//
//  SetupSchedViewController.swift
//  Scheddit
//
//  Created by Michael V. Corpus on 26/12/2017.
//  Copyright © 2017 Michael V. Corpus. All rights reserved.
//

import UIKit

class SetupSchedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LogoutSegue(_ sender: Any) {
        performSegue(withIdentifier: "LogoutSegue", sender: nil)
    }
    

    
}
