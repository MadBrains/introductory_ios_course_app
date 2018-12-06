//
//  ViewController.swift
//  TestApp
//
//  Created by Antol Peshkov on 28/11/2018.
//  Copyright © 2018 Mad Brains. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var realm: Realm { return try! Realm() }
    var factId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let realFactId = factId else {
            return
        }
        
        let fact = realm.object(ofType: Fact.self, forPrimaryKey: realFactId)
        label.text = fact?.text
    }

    @IBAction func buttonTap(_ sender: Any) {
        //Do nothing
    }
}


