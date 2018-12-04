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
        label.text = "Hello, World! Hello, World! Hello, World!"
        
        let url = URL(string: "https://cat-fact.herokuapp.com/facts")!
        let task = URLSession.shared.dataTask(with: url, completionHandler: handleResponse)
        task.resume()
    }
    
    func handleResponse(data: Data?, response: URLResponse?, error: Error?) {
        do {
            let values = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, Any>
            let facts = values["all"] as! Array<Any>
            print(facts.first!)
        } catch {
            print("Что-то пошло не так")
        }
    }
    
}

