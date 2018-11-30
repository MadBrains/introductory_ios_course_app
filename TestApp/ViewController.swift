//
//  ViewController.swift
//  TestApp
//
//  Created by Antol Peshkov on 28/11/2018.
//  Copyright © 2018 Mad Brains. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "triam"
        label.textColor = UIColor.red
        button.backgroundColor = UIColor.green
    }

    @IBAction func buttonTap(_ sender: Any) {
        label.font = UIFont.systemFont(ofSize: 30)
        label.text = "Hello, World!"
    }
    
}

